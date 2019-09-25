FROM google/dart:2.5

RUN dart --version

RUN apt-get update -qq
RUN apt-get update && apt-get install -y \
    parallel \
	# wget is used to install chrome
    wget \
	# xvfb is used to run browser tests headless
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# Install chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
RUN apt-get -qq update && apt-get install -y google-chrome-stable
RUN mv /usr/bin/google-chrome-stable /usr/bin/google-chrome
RUN sed -i --follow-symlinks -e 's/\"\$HERE\/chrome\"/\"\$HERE\/chrome\" --no-sandbox/g' /usr/bin/google-chrome

# Expose env vars for git ssh access
ARG GIT_SSH_KEY
ARG KNOWN_HOSTS_CONTENT
# Install SSH keys for git ssh access
RUN mkdir /root/.ssh
RUN echo "$KNOWN_HOSTS_CONTENT" > "/root/.ssh/known_hosts"
RUN echo "$GIT_SSH_KEY" > "/root/.ssh/id_rsa"
RUN chmod 700 /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa
RUN echo "Setting up ssh-agent for git-based dependencies"
RUN eval "$(ssh-agent -s)" && \
	ssh-add /root/.ssh/id_rsa

# Build Environment Vars
ARG BUILD_ID
ARG BUILD_NUMBER
ARG BUILD_URL
ARG GIT_COMMIT
ARG GIT_BRANCH
ARG GIT_TAG
ARG GIT_COMMIT_RANGE
ARG GIT_HEAD_URL
ARG GIT_MERGE_HEAD
ARG GIT_MERGE_BRANCH

WORKDIR /build/
ADD . /build/

RUN pub global activate tuneup
RUN pub get

RUN echo "\n\nChecking Code Quality..."
RUN parallel --halt now,fail=1 ::: \
    'pub run dart_dev sass -r' \
    'pub run abide' \
    'pub run dependency_validator --no-fatal-pins -i abide' \
    'pub run dart_dev format --check' \
    'pub run dart_dev gen-test-runner --check'

RUN echo "\n\nBuilding lib (ddc)..." && \
    pub run build_runner build

RUN echo "\n\nAnalyzing Sources..." && \
    pub global run tuneup check --ignore-infos

RUN \
    if [ "$GIT_TAG" != "" ] ; \
    then \
      echo "\n\nTagged build. Skipping tests..." && \
      echo "\n\nBuilding lib (dart2js)..." && \
      pub run build_runner build -r && \
      ./tool/generate_dartdocs.sh ; \
    else \
      # Generate an empty dartdoc artifact so the build doesn't fail
      touch /build/api.tar.gz && \
      echo "\n\nRunning Tests..." && \
      pub run dart_dev test ; \
    fi

RUN echo "\n\nProducing pub library artifact + compiled CSS files for CDN deploy..." && \
    tar czvf over_react_window.pub.tar.gz LICENSE README.md pubspec.yaml build.yaml lib/

ARG BUILD_ARTIFACTS_DOCUMENTATION=/build/api.tar.gz
ARG BUILD_ARTIFACTS_DART-DEPENDENCIES=/build/pubspec.lock
ARG BUILD_ARTIFACTS_BUILD=/build/pubspec.lock
ARG BUILD_ARTIFACTS_PUB=/build/over_react_window.pub.tar.gz

FROM scratch
