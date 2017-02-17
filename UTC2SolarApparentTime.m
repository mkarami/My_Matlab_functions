function [SAT_Days,SMT_Days] = UTC2SolarApparentTime(jday,Lon)

%SAT_Days: solar apparant time
%SMT_Days: solar mean time
%jday: absolute julian date
%Lon: longitude

EoT = EquationOfTime(jday);
SMT_Days = jday + (Lon.*4)./1440;
SAT_Days = SMT_Days + EoT./1440;
end