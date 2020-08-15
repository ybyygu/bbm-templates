#! /usr/bin/env bash
source /share/apps/gulp/env.rc

# keep the keyword line only for the first molecule
sed '1!{/delete-marker/d}' | tee test.gin | gulp 2> err.log > gulp.out

# parse all results
gulp-adaptor -a gulp.out


