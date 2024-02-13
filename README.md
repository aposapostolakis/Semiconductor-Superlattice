# Semiconductor-Superlattice
Semiconductor Superlattice miniband-structure analysis


This repository contains GNU Octave programs for analyzing semiconductor superlattice structures. The provided programs can calculate Bloch functions, energy miniband dispersion, and widths of minibands. Currently, the code calculates the widths of the first three minibands, but it can be easily extended to handle higher minibands.

**Methodology**:
The method employed in this analysis involves discretizing the time-independent Schrödinger equation (TISE) into a matrix problem [1, 2]. This approach allows for efficient computation of the energy miniband dispersion and widths of minibands in semiconductor superlattice structures.

Additionally, insights from the following works have been incorporated:

[1] Greenaway, Mark Thomas. "Single particle and collective dynamics in periodic potentials." Diss. University of Nottingham, 2010.

[2] Rourke, David E., Larisa A. Khodarinova, and T. Mark Fromhold. "Band structure engineering: A simple way to optimize key features of one-dimensional energy bands." Physical Review B 72.15 (2005): 155334.



**Directories**

* GaAs-AlAs: Contains code for generating data figures and files for energy dispersions (dispersion_plot...png) and basic calculated parameters (miniband_properties_...png) for structures such as the studied [3,4]

* GaAs-InAs-AlAs: Similarly, contains code for analyzing semiconductor superlattices.

References:

[3] Pereira, M. F., et al. "Theory and measurements of harmonic generation in semiconductor superlattices with applications in the 100 GHz to 1 THz range." Physical Review B 96.4 (2017): 045306.

[4] Apostolakis, Apostolos, et al. "Beyond the ordinary acoustoelectric effect: Superluminal phenomena in the acoustic realm and phonon-mediated Bloch gain." Physical Review B 106.1 (2022): 014312.

[5] Gaifullin, M. B., et al. "Microwave generation in synchronized semiconductor superlattices." Physical Review Applied 7.4 (2017): 044024.

**Usage**

1. Clone the repository.
2. Make sure you have GNU Octave installed.
3. Navigate to the directory containing the GNU Octave code.
4. Compile and execute the code(s) using the following command in the terminal:

```bash
octave-cli SLmbdismain.m
```


```bash
octave-cli SLmbdismain2.m
```



This command generates files related to energy dispersion and basic calculated parameters. The results are stored in both a text file and displayed in the terminal.


**Prerequisites:**
GNU Octave (This project was tested with GNU Octave (version 4.2.2) on Ubuntu 18.04.6 LTS.)

Note: While the program was developed and tested using GNU Octave, it may also work with Matlab, as the initial development was done in a Matlab environment.

