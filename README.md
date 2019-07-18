Folder and file summary:

 - `RawData/`
 - `ProcessedData/`

***

This repository contains data used in ["Sediment traps with guiding channel and hybrid check dams improve controlled sediment retention"](https://www.nat-hazards-earth-syst-sci.net/18/647/2018/) ([Download open access article](https://www.nat-hazards-earth-syst-sci.net/18/647/2018/nhess-18-647-2018.pdf)).

The data stem from laboratory experiments with the setup described in my PhD thesis ([Schwindt 2017](https://infoscience.epfl.ch/record/229862/files/EPFL_TH7655.pdf?version=1)). Data processing was done with *Python* (see [pydroscape](https://sschwindt.github.io/pydroscape/)) and *Matlab* / *Octave* codes.

## Citation

Suggested citation:

*Schwindt, S.; Franca, M. J.; Reffo, A. & Schleiss, A. J. "Sediment traps with guiding channel and hybrid check dams improve controlled sediment retention". Natural Hazards and Earth System Science, 2018, 18(2), 647-668. doi: 10.5194/nhess-18-647-2018*

LaTex / Bibtex Users:

```
@Article{schwindt18a,
  author    = {Schwindt, S and Franca, M J and Reffo, A and Schleiss, A J},
  title     = {Sediment traps with guiding channel and hybrid check dams improve controlled sediment retention},
  journal   = {Natural Hazards and Earth System Science},
  year      = {2018},
  volume    = {18},
  number    = {2},
  pages     = {647-668},
  doi       = {10.5194/nhess-18-647-2018},
  url       = {https://www.nat-hazards-earth-syst-sci.net/18/647/2018/},
}
```

## Codes
 Signal processing was done with *Python* and the [pydroscape](https://sschwindt.github.io/pydroscape/)) package. The data analyses where made with *Matlab* / *Octave* (`.m`) codes, where codes starting with an `f[...].m` mark files containing functions. All other `.m` files are algorithms that use these functions. Please note that all codes were originally written in *Matlab* and processing them with *Octave* may require adding `pkg load io` after the `clear all; close all;` statements in the codes.

## Data structure and codes

The **`RawData/`** folder contains the raw data from the pump discharge logger, flow velocity (where applicable), sediment supply/outflow loggers, barrier height and composition, and constriction geometry. The `RawData/ExperimentOverview.xlsx` workbook contains overview tables of the conducted experiments. In addition, the following workbooks are available:

 - `20161123_validation_kinect_vs_USprobes.xlsx` compares the motion-sensing device (Microsoft's Kinect) with the measurement of the ultrasonic probes.
 - `hydrograph_[...].xlsx` contain the standard hydrograph (Figure 7 in the paper) and small variations of the hydrograph in the `06502` and `06509` runs.

The **`ProcessedData/`** folder contains data that where extracted from the `RawData/` folder. *Matlab* / *Octave* (`.m`) codes in that folder were used for extracting / converting the raw data.

The **`ProcessedData/000_data_summary/`** folder contains *Matlab* / *Octave* (`.m`) codes that created workbooks documenting sediment deposition (and re-mobilization):

 - `summary_flushing.xlsx` and `Flushing/` contain experimental data of flushing phases, which were run after every hydrograph test (Figure 12).
 - `summary_hydrographs.xlsx` and `Hydrographs/` contain minute-wise measurements from the hydrograph tests (Figure 8 and Figure 9 from `Hydrographs/20161103_volume_measurements.xlsx/export plot`). 

The **`ProcessedData/001_regression_analysis/`** folder contains workbooks and  *Matlab* / *Octave* (`.m`) codes for the linear data regression shown in Figure 14.

The **`ProcessedData/002_plots/`** folder contains *Matlab* / *Octave* (`.m`) codes for producing Figure 10 (`/Contour 2D/`) and Figure 14 (`/xProfiles/`). Note that the data files for producing the 2D contour plots are too big for providing them here. Please [contact me](https://sebastian-schwindt.org/contact.html) to obtain these data via temporary file sharing.

