# Set JAVA_HOME
JAVA_HOME=/Users/inbravo/Documents/opensource/jdk-17
export JAVA_HOME

# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
PATH="/opt/homebrew/bin/python3.11/bin:${PATH}"
export PATH

# Set variable for Python
export PYSPARK_PYTHON=python3
export PYSPARK_DRIVER_PYTHON=python3

# Set variables for Hadoop
HADOOP_HOME=/Library/Hadoop/hadoop-2.7.3
export HADOOP_HOME;

eval "$(/opt/homebrew/bin/brew shellenv)"

# System aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

