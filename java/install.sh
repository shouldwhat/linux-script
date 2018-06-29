
#
# This script install JDK.
#
DOWNLOAD_URL=http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz
FILE_NAME=jdk1.8.0_171
TAR_NAME=jdk-8u171-linux-x64.tar.gz

#
# [Step.1] Download JDK
#
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "$DOWNLOAD_URL"

#
# [Step.2] Install
#
tar -xvf $TAR_NAME

rm -rf /usr/lib/jvm/$FILE_NAME
mv -f $FILE_NAME /usr/lib/jvm

cd /usr/lib/jvm

rm -f java-1.8
ln -f -s $FILE_NAME java-1.8

rm -f jre-1.8
ln -f -s $FILE_NAME/jre jre-1.8

#
# [Step.3] Configure
#
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8" >> ~/.bashrc
echo "export JRE_HOME=/usr/lib/jvm/jre-1.8" >> ~/.bashrc
echo "export PATH=$PATH:\$JAVA_HOME/bin:\$JRE_HOME/bin" >> ~/.bashrc

source ~/.bashrc

#
# [Step.4] Check
#

echo -e
echo -e
echo "*. Check JAVA_HOME = "$JAVA_HOME
echo "*. Check JRE_HOME = "$JRE_HOME
echo "*. Check JAVA_VERSION = "
java -version
echo -e
echo -e
