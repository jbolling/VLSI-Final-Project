*Final Project
*Single CNFET Simulation
.lib 'nano_model_39/CNFET.lib' CNFET

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
.param ptubes=1

*Voltage Sources
vdd drain 0 pvds
*vin gate 0 pvgs
vin gate 0 pulse(0 pvgs 0 10p 10p 20 40)

*Transistor
XDevice drain gate 0 0 NCNFET tubes=ptubes

*DC sweep on gate
.dc ptubes 1 200 1 vin 0 pvgs pvgs 
*.dc ptubes 1 200 1
*.tran 0.01p 200p sweep ptubes 1 100 1
.end
