FROM jenkins
MAINTAINER Ming Gong, gongmingqm10@gmail.com
USER root
RUN apt-get update && apt-get -y install libstdc++6 lib32z1 lib32stdc++6 expect

# Add Android SDK
RUN wget --progress=dot:giga http://dl.google.com/android/android-sdk_r24.1.2-linux.tgz
RUN mv android-sdk_r24.1.2-linux.tgz /opt/
RUN cd /opt && tar xzvf ./android-sdk_r24.1.2-linux.tgz
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
RUN echo $PATH
RUN echo "y" | android update sdk -u --filter platform-tools,android-21
RUN echo "y" | android update sdk -u --all --filter 5
RUN chmod -R 755 $ANDROID_HOME

RUN apt-get install -y git-core
RUN android update sdk --no-ui
