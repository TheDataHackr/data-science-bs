# Data Science Bite Sized (data-science-bs)
A repository to support all The Data Hackr - Data Science BS (Bite-Sized) posts.

## How to Setup Your Environment
### Docker
Use the following process to build the docker image:

[Install Docker Desktop](https://www.docker.com/products/docker-desktop/)

From the Terminal change directories to the directory containing the Dockerfile and run the following line:
```
Windows/Mac OS:
  docker build -t dsbs-python -f Dockerfile .
Linux:
  docker build -t dsbs-python --build-arg UID=$(id -u) --build-arg UNAME=$(whoami) --build-arg GID=$(id -g) --build-arg GNAME=$(whoami) -f Dockerfile .
```

To start the container and get a command prompt:
```
Windows:
  docker run -v "C:\Users\username\path\to\data-science-bs":/opt/project -it sccpython bash
Mac OS:
  docker run -v /Users/username/path/to/data-science-bs:/opt/project -it sccpython bash
Linux:
  docker run -v /home/username/path/to/data-science-bs:/opt/project -it sccpython bash
```

To run code from the repository (from inside the command prompt from above):
```
cd /opt/project/machine_learning/basics/classification/logistic_regression/
python logit_classification.py
```

#### Debugging
Insert the following anywhere in the code to drop to an [ipdb](https://github.com/gotcha/ipdb) debugging prompt:
```
breakpoint()
```
If you want autocomplete and color coding from IPython, you need to enter the following once in ipdb:
```
from IPython import embed; embed(user_ns=locals(), colors='neutral')
```

### Virtual Environment
I would strongly suggest against this approach if you're on Windows. It's just a pain.

If you're on Linux or Mac OS, this is much more straightforward.

First check to see what version of Python you have running on your machine and compare that to the Python version shown in the Docker file in this respotiory:
```
python3 --version
```
We want the version to be close, if not the same as what is used in this repository.

Check to see if ```pip3``` is installed:
```
pip3 --version
```
If you don't have ```pip3```, then you'll need to install it with. See [here](https://pip.pypa.io/en/stable/installation/) for instructions.

If you're having trouble installing ```pip``` on Linux, you might need to do the following:
```
sudo apt update
sudo apt install python3-pip
```

Then, you will need to install ```virtualenv``` with the following:
```
pip3 install virtualenv
```

If you have trouble installing ```virtualenv```, see [here](https://virtualenv.pypa.io/en/latest/installation.html) for help. On Linux you might need to do:
```
sudo apt install python3-virtualenv
```
#### Create a Virtual Environment
In order to properly keep track of multiple virtual environments, I suggest creating a folder to keep them all in.
```
mkdir ~/VirtualEnvironments
cd ~/VirtualEnvironemnts
```
From inside your ```VirtualEnvironments``` directory, create the virtual environment for this repository:
```
virtualenv dsbs-python
```
This will create a new directory called ```dsbs-python``` inside your ```VirtualEnvironments``` directory, which will house all of your python dependencies.

Now we will need to activate the virtual environment and install all of the dependencies:
```
cd ~/VirtualEnvironments/dsbs-python
source bin/activate
```
At this point you should see the text ```(dsbs-python)``` at the front of your command prompt.

Finally, we'll install the dependencies:
```
cd ~
git clone https://github.com/TheDataHackr/data-science-bs.git
cd ~/data-science-bs/provision
pip install -r requirements.txt
```

#### Running code in an Virtual Environment
You will need to make sure your virtual environment is activated. You should see a ```(dsbs-python)``` at the front of your command prompt. Something like:
```
(dsbs-python) username@computername:~$
```
If this is not the case, you can activate it with:
```
source ~/VirtualEnvironments/dsbs-python/bin/activate
```
You can always turn off (or deactivate) your virtual environment with:
```
deactivate
```
Once you've confirmed the virtual environment is activated, it's time to run some code (Exactly the same as docker now):
```
cd ~/data-science-bs/machine_learning/basics/classification/logistic_regression/
python logit_classification.py
```
For debugging, please refer to the debugging section in the Docker section above.
