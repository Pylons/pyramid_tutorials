var
  gulpLoadPlugins = require('gulp-load-plugins'),
  plugins = gulpLoadPlugins(),
  gulp = require('gulp');


gulp.task('webserver', function () {
  gulp.src('dist')
    .pipe(
    plugins.webserver(
      {
        livereload: false,
        port: 9000
      }));
});


gulp.task('default', [
  'webserver'
]);
