set terminal eps enhanced
set key left

set xlabel 'Bits in Composite'
set ylabel 'Average Time (Milliseconds)'

set output 'spar-vanilla.eps'
set xrange [16:40]
set yrange [0:12000]
plot 'spar-vanilla-timings.dat' using 1:7 with lines t 'SPAR'

set output 'spar-bound-attempts.eps'
plot 'spar-vanilla-timings.dat' using 1:7 with lines t 'SPAR', \
     'spar-attempts-8-timings.dat' using 1:7 with lines t '8 Ideals per Group'

set output 'spar-bound-attempts2.eps'
plot 'spar-vanilla-timings.dat' using 1:7 with lines t 'SPAR', \
     'spar-attempts-8-timings.dat' using 1:7 with lines t '8 Ideals per Group', \
     'spar-dyn-attempts-timings.dat' using 1:7 with lines t 'Variable Ideals per Group'
     
set output 'spar-to-sspar.eps'
plot 'spar-vanilla-timings.dat' using 1:7 with lines t 'SPAR', \
     'spar-attempts-8-timings.dat' using 1:7 with lines t '8 Ideals per Group', \
     'spar-dyn-attempts-timings.dat' using 1:7 with lines t 'Variable Ideals per Group' lc 3, \
     'sspar-theoretical-timings.dat' using 1:7 with lines t 'Bounded Primorial Steps' lc 4

set xrange [16:60]
set yrange [0:2500]
set output 'sspar-theoretical.eps'
plot 'sspar-theoretical-timings.dat' using 1:7 with lines t 'Bounded Primorial Steps' lc 4

set output 'sspar-power-bound.eps'
plot 'sspar-theoretical-timings.dat' using 1:7 with lines t 'Bounded Primorial Steps' lc 4, \
     'sspar-theoretical-bounded-power-timings.dat' using 1:7 with lines t 'Bounded Prime Power in Exponent' lc 5

set output 'sspar-noreuse.eps'
plot 'sspar-theoretical-timings.dat' using 1:7 with lines t 'Bounded Primorial Steps' lc 4, \
     'sspar-theoretical-bounded-power-timings.dat' using 1:7 with lines t 'Bounded Prime Power in Exponent' lc 5, \
     'sspar-noreuse-timings.dat' using 1:7 with lines t 'Independent Exponent and Search' lc 2

set output 'sspar-optimized.eps'
plot 'sspar-theoretical-timings.dat' using 1:7 with lines t 'Bounded Primorial Steps' lc 4, \
     'sspar-theoretical-bounded-power-timings.dat' using 1:7 with lines t 'Bounded Prime Power in Exponent' lc 5, \
     'sspar-noreuse-timings.dat' using 1:7 with lines t 'Independent Exponent and Search' lc 2, \
     'sspar-optimized-timings.dat' using 1:7 with lines t 'Only Search Once' lc 3

set xrange [16:40]
set yrange [*:*]
set output 'spar-vs-sspar.eps'
plot 'spar-vanilla-timings.dat' using 1:7 with lines t 'Vanilla SPAR' lc 1, \
     'sspar-optimized-timings.dat' using 1:7 with lines t 'Tweaked SuperSPAR' lc 3
     