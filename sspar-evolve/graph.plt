set terminal eps enhanced
set key left

set xlabel 'Bits in Composite'
set ylabel 'Average Time (Milliseconds)'

set output 'spar-vanilla.eps'
set xrange [16:40]
plot 'spar-vanilla-timings.dat' using 1:7 with lines t 'SPAR'

set output 'spar-bound-attempts.eps'
plot 'spar-vanilla-timings.dat' using 1:7 with lines t 'SPAR', \
     'spar-attempts-8-timings.dat' using 1:7 with lines t '8 Ideals per Group', \
     'spar-dyn-attempts-timings.dat' using 1:7 with lines t 'Variable Ideals per Group'

set output 'spar-to-sspar.eps'
plot 'spar-dyn-attempts-timings.dat' using 1:7 with lines t 'Variable Ideals per Group', \
     'sspar-theoretical-timings.dat' using 1:7 with lines t 'Bounded Primorial Steps'

set xrange [16:60]
set output 'sspar-power-bound.eps'
plot 'sspar-theoretical-timings.dat' using 1:7 with lines t 'Bounded Primorial Steps', \
     'sspar-theoretical-bounded-power-timings.dat' using 1:7 with lines t 'Bounded Prime Power in Exponent'

set output 'sspar-noreuse.eps'
plot 'sspar-theoretical-bounded-power-timings.dat' using 1:7 with lines t 'Bounded Prime Power in Exponent', \
     'sspar-noreuse-timings.dat' using 1:7 with lines t 'Independent Exponent and Search'

set xrange [16:80]
set output 'sspar-optimized.eps'
plot 'sspar-noreuse-timings.dat' using 1:7 with lines t 'Independent Exponent and Search', \
     'sspar-optimized-timings.dat' using 1:7 with lines t 'Only Search Once'

set xrange [16:40]
set output 'spar-vs-sspar.eps'
plot 'spar-vanilla-timings.dat' using 1:7 with lines t 'Vanilla SPAR', \
     'sspar-optimized-timings.dat' using 1:7 with lines t 'Tweaked SuperSPAR'
     