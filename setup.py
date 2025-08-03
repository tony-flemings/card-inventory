from setuptools import setup, find_packages

setup(
    name="SportsCardTool",
    version="0.1.0",
    packages=find_packages(where="SportsCardTool"),
    package_dir={"": "SportsCardTool"},
    install_requires=[],
    author="Tony",
    description="A tool for scraping and analyzing sports card data",
)
