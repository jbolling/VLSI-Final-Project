*Final Project
*Single CNFET Simulation
*.lib '../nano_model_39/CNFET.lib' CNFET
.include '32nm_MGK.pm'

.options NOMOD 		POST
.options AUTOSTOP
.options INGOLD=2	DCON=1
.options GSHUNT=1e-12	RMIN=1e-15
.options ABSTOL=1e-5	ABSVDC=1e-4
.options RELTOL=1e-2	RELVDC=1e-2
.options NUMDGT=4	PIVOT=13

*Parameters
.param TEMP=27
.param pvds=0.9V
.param pvgs=0.9V

*Voltage Sources
vdd drain 0 pvds
vin gate 0 pvgs

*Transistor
m1 drain gate 0 0 nmos l=32n w=43n

*DC sweep on gate
.dc vdd 0 pvds 0.01 vin 0 pvgs 0.1
.end
