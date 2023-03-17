# TDBenchmarker

Source code of the TD Benchmarker tool. The tool is hosted [here](http://195.251.210.147:3838/).

TD Benchmarker toolbox is an interactive web-based application implemented using Shiny framework taking advantage of the R statistical language in an easy-to-use frontend. The toolbox supports a fully automated investigation of the degree of agreement between three leading TD assessment tools. Moreover, TD Benchmarker provides a general framework to capture the diversity of the examined tools with the aim of identifying few 'reference assessments' representing different profiles of classes with respect to their TD levels. After the characterization of the derived reference assessments, the goal is to extract a set of classes presenting high similarity to the Max-Ruler reference assessment. The Max Ruler reference assessment represents the profile of classes accumulating high amount of TD based on the results of all applied tools.

The core methodology of the toolbox is Archetypal Analysis, which is a statistical methodology that explores the multidimensional space with the aim of identifying certain points, namely the archetypes, located on the boundaries of a swarm of given points, known as their convex hull.

TD Benchmarker is ready to report the results derived from the analysis on TD assessments provided by the application of three leading TD assessement tools (Sonar, Squore, Cast) through a benchmark experiment of 25 Java and 25 JS OSS projects with a fully automated manner offering:

Report on the degree of agreement of the applied tools with respect to the measured TD of classes.
Identification of few reference TD assessments.
Extraction of a benchmark of high-TD classes based on the agreement of all TD tools.
