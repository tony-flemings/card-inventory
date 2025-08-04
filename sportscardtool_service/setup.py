from setuptools import setup, find_packages

setup(
    name='sportscardtool-service',
    version='0.1',
    packages=find_packages(),
    install_requires=[
        'requests',
        'beautifulsoup4',
    ],
    entry_points={
        'console_scripts': [
            'sportscardtool=sportscardtool.scrape_cards:main',
        ],
    },
)
