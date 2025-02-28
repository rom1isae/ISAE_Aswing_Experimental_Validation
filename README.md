ASWING Validation Cases Repository  

Author:  

This repository was created and is maintained by:  
Romain. P. Jan  
Post-Doctoral Researcher, ISAE-SUPAERO, France, Toulouse  
romain.jan@isae-supaero.fr 


This repository gathers all validation cases upon 
experimental data for ASWING, a software from MIT 
designed for analyzing the aerodynamic, structural, 
and aeroelastic behavior of aircraft. The repository 
is organized into several folders, each dedicated to 
different aspects of the validation process.  

---

Repository Structure  

1. Aerodynamics  
   This folder contains validation cases related to 
   aerodynamic performance, including:  
   - SA: Steady Validation Cases: Experimental comparisons 
     for steady-state aerodynamic analysis.  
   - UA: Unsteady Validation Cases: Validation of unsteady 
     aerodynamic behavior.  
   - Numerical Convergence Analysis: Assessment of 
     numerical convergence Extended Lifting Line Model.  
   - Warning: Case number SA-9 has been lost, it is currently 
              being reproduced. 

2. Propellers  
   This folder includes:  
   - P: Propeller Validation Cases: Experimental validation 
     for propeller aerodynamic performance and efficiency.  
   - AP: Aero Propeller Validation Cases: Experimental validation 
     for Propeller Lifting surface interactions.

3. Structure  
   This section covers validation cases for structural 
   analysis:  
   - ST: Structure Validation Cases: Comparison of structural 
     behavior predictions with experimental data.  
   - Numerical Convergence Analysis: Numerical convergence 
     studies related to structural simulations.  

4. Aeroelasticity  
   This folder includes cases related to the aeroelastic 
   response of aircraft:  
   - AE: Aeroelasticity Validation Cases: Validation of 
     aeroelastic behavior predictions.  
   - FFWT: Flared Folding Wing Tips: Specific validation cases 
     for flared folding wing tip configurations.  

5. Technical Reports  
   Contains the technical reports associated with each 
   of the above categories:  
   - Four Technical Reports: Detailed documentation and 
     analysis corresponding to Aerodynamics, Propellers, 
     Structure, and Aeroelasticity validation cases  

6. Utilitaries  
   This folder provides useful tools to facilitate data 
   extraction:  
   - Matlab and Python Functions: Scripts and utilities 
     for processing and analyzing data from the validation 
     cases.  

---

Getting Started  

1. Clone the repository:  
      git clone <repository-url>  
      cd <repository-folder>  

2. Install dependencies:  
   - For Matlab scripts: Ensure Matlab is installed and 
     properly configured.  
   - Aswing 5.96 or above must be installed.
   - In every shell script (.sh extension) make sure your Aswing path is 
     setup correctly 
   - For Python scripts: Install required Python packages 
     using:  
     pip install -r requirements.txt  

3. Navigate to the desired folder to explore the validation 
   cases or run the data extraction scripts in the Utilitaries 
   folder.  

---

Contributing:  

Contributions are welcome! If you wish to add new validation 
cases, improve the existing scripts, or enhance documentation:  
- Fork the repository.  
- Create a new branch for your feature or fix.  
- Submit a pull request with a clear description of the changes 
  made. 
- If you add new validation cases stack them to the original one with a 
prescript "e" like "eST7" for example, so that external contributions are 
clearly highlighted. Your contributor's name will be added to the 
README file. We will add also a comment in the citation section so that 
your paper where you have presented the new case can be cited. 

--

How to cite
If you plan to use these validation cases in your work for future 
publications please cite the following technical reports depending on the
case you have reproduced:
1 - Aerodynamic cases

@techreport{jan2023experimental,
  title={Experimental validation of ASWING. Part I: Aerodynamics},
  author={Jan, R}} 

2 - Propeller Cases

@techreport{jan2023experimental,
  title={Experimental validation of ASWING. Part II: Propellers},
  author={Jan, R}}

3 - Structure Cases

@techreport{jan2023experimental,
  title={Experimental validation of ASWING. Part III: Structure},
  author={Jan, R}}

4 - Aerodynamic Cases

@techreport{jan2023experimental,
  title={Experimental validation of ASWING. Part IV: Aeroelasticity},
  author={Jan, R}}


Acknowledgments  

Special thanks to the team behind ASWING at MIT for developing 
and maintaining the software, as well as to the researchers who 
provided the experimental data for validation.  
Special thanks to Prof Mark Drela and Prof Rafael Palacios for reviewing
this work as part of R. JAN PhD Thesis referee. 

---


