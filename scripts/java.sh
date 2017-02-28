#!/bin/bash

DOTFILE_STRING="[.dotfiles/scripts/java-jdk.sh] ";
WRENCH_EMOJI=$'\xF0\x9F\x94\xA7';
SHELL_EMOJI=$'\xF0\x9F\x90\x9A';
FIRE_EMOJI=$'\xF0\x9F\x94\xA5';
OK_EMOJI=$'\xE2\x9C\x85';
NOK_EMOJI=$'\xE2\x9B\x94';

###############################################################################
# Install Java 7 and Java 8                                                   #
###############################################################################

# Check if Java 7 is installed; install if not
if ls /Library/Java/JavaVirtualMachines/jdk1.7.* 1> /dev/null 2>&1;
then
	echo $DOTFILE_STRING $OK_EMOJI ": Java 7 is already installed!";
else
	echo $DOTFILE_STRING $NOK_EMOJI ": Java 7 is NOT installed!";
	echo $DOTFILE_STRING $WRENCH_EMOJI ": Installing Java 7...";
	brew update;
	brew cask install java7;
	echo $DOTFILE_STRING $OK_EMOJI ": Java 7 is now installed!";
fi

# Check if Java 8 is installed; install if not
if ls /Library/Java/JavaVirtualMachines/jdk1.8.* 1> /dev/null 2>&1;
then
	echo $DOTFILE_STRING $OK_EMOJI ": Java 8 is already installed!";
else
	echo $DOTFILE_STRING $NOK_EMOJI ": Java 8 is NOT installed!";
	echo $DOTFILE_STRING $WRENCH_EMOJI ": Installing Java 8...";
	brew update;
	brew cask install java;
	echo $DOTFILE_STRING $OK_EMOJI ": Java 8 is now installed!";
fi

###############################################################################
# Install and configure jenv                                                  #
###############################################################################

echo $DOTFILE_STRING $WRENCH_EMOJI ": Installing jenv...";
brew update;
brew install jenv;

# Get installed JDK versions
JDK7=$(ls /Library/Java/JavaVirtualMachines | grep jdk1.7);
JDK8=$(ls /Library/Java/JavaVirtualMachines | grep jdk1.8);

JDK7_PATH=$'/Library/Java/JavaVirtualMachines/'${JDK7}'/Contents/Home/'
JDK8_PATH=$'/Library/Java/JavaVirtualMachines/'${JDK8}'/Contents/Home/'

# Configure jenv
jenv add $JDK7_PATH;
jenv add $JDK8_PATH;
jenv rehash

###############################################################################
# Install brews who need Java                                                 #
###############################################################################
brew update;
brew install ant;
brew install bazel;
brew install maven;

brew cleanup && brew doctor;