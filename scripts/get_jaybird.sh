#!/bin/bash
MVN_CMD='mvn dependency:get'
TARGET_DIR='../target/3rdparty'

#Jaybird
GROUP_ID_JAYBIRD='org.firebirdsql.jdbc'
ARTIFACT_ID_JAYBIRD='jaybird'
VERSION_JAYBIRD='5.0.4.java11'
JAR_JAYBIRD="$HOME/.m2/repository/org/firebirdsql/jdbc/$ARTIFACT_ID_JAYBIRD/$VERSION_JAYBIRD/$ARTIFACT_ID_JAYBIRD-$VERSION_JAYBIRD.jar"

# JNA
GROUP_ID_JNA='net.java.dev.jna'
ARTIFACT_ID_JNA='jna'
VERSION_JNA='5.12.1'
JAR_JNA="$HOME/.m2/repository/net/java/dev/jna/$ARTIFACT_ID_JNA/$VERSION_JNA/$ARTIFACT_ID_JNA-$VERSION_JNA.jar"

$MVN_CMD -DgroupId=$GROUP_ID_JAYBIRD -DartifactId=$ARTIFACT_ID_JAYBIRD -Dversion=$VERSION_JAYBIRD
$MVN_CMD -DgroupId=$GROUP_ID_JNA -DartifactId=$ARTIFACT_ID_JNA -Dversion=$VERSION_JNA

# Check if target directory exists, if not create it
if [ ! -d "$TARGET_DIR" ]; then
  mkdir $TARGET_DIR
fi

# Move jars to target directory
mv $JAR_JAYBIRD $TARGET_DIR
mv $JAR_JNA $TARGET_DIR

echo "Download and move operation completed!"