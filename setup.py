"""
https://stackoverflow.com/questions/43816791/importing-from-python-modules-inside-parent-directory-into-jupyter-notebook-file

Another solution is to move all your Python modules (.py files) into a folder and make them an installable package. If you pip install it into your current environment, you can then import the package into any notebook in that environment, regardless of folder structure.

So in your situation you could have:

project_folder/
  notebooks/
    notebook01.ipynb
    notebook02.ipynb
    ...
    notebookXY.ipynb
  my_package/
    __init__.py
    module01.py
    module02.py
    module03.py
  setup.py

    __init__.py can just be an empty file, and tells Python "everything in this folder is part of a package"
    For an explanation of what goes in setup.py see here.

A basic setup.py can be as simple as this:

import setuptools

setuptools.setup(
    name="my_package",
    version="0.0.1",
    description="A small example package",
    packages=setuptools.find_packages(),
    python_requires='>=3.7',
)

Install it:

cd project_folder
pip install -e .

Including the optional -e flag will install my_package in "editable" mode, 
meaning that instead of copying the files into your virtual environment, 
a symlink will be created to the files where they are
"""

import setuptools

setuptools.setup(
    name="fwipy",
    version="0.0.1",
    description="A small example package",
    packages=setuptools.find_packages(),
    python_requires='>=3.7',
)
