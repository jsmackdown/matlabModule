function SolarLacModule()

%identify this domain and var name (adjust this as needed)
here = pwd;
var = 'Sol_Allpure';

%load data struct
eval(['load(''' here '\' var '.mat'');']);

%generate list of case names
names = fieldnames(Sol_All.S);

%identify pathways to values of interest (point vars)
pathUi = 'Sol_All.Uinf.';
pathus = 'Sol_All.u_star.';
pathRe = 'Sol_All.Re_mod.';
pathMt = 'Sol_All.theta_m.';
pathNu = 'Sol_All.Nu_diag_r.';
pathSt = 'Sol_All.Sta_r.';
pathLi = 'Sol_All.LAC.Lnorm_Rnorm_int.';

%identify pathways to vector values of interest
pathLn = 'Sol_All.LAC.L3dNorm.';


%fetch values of interest
for n = 1: length(names)
    eval(['mt(n) =' pathMt (names{n}) ';'])
    eval(['us(n) =' pathus (names{n}) ';'])
    eval(['St(n) =' pathSt (names{n}) ';'])
    eval(['Ui(n) =' pathUi (names{n}) ';'])
    eval(['Re(n) =' pathRe (names{n}) ';'])
    eval(['Nu(n) =' pathNu (names{n}) ';'])
    eval(['Li(n) =' pathLi (names{n}) ';'])    
    eval(['nLacs(n,1:length(' pathLn (names{n}) ')) = '  pathLn (names{n}) ';'])
end

%assign struct in base (optional)
assignin('base','Sol',Sol_All)

%assign target values in base domain
assignin('base','cases',names)
assignin('base','nLacs',nLacs)
evalin('base','nLacs(nLacs==0)=nan;')
assignin('base','mt',mt)
assignin('base','Ui',Ui)
assignin('base','us',us)
assignin('base','Re',Re)
assignin('base','Nu',Nu)
assignin('base','Li',Li)
assignin('base','St',St)

end
