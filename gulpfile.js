"use strict";

var gulp = require("gulp");
var plumber = require("gulp-plumber");
var purescript = require("gulp-purescript");
var jsvalidate = require("gulp-jsvalidate");

var paths = [
  "src/**/*.purs",
  "bower_components/purescript-*/src/**/*.purs"
];

gulp.task("make", function() {
  return gulp.src(paths)
    .pipe(plumber())
    .pipe(purescript.pscMake());
});

gulp.task("jsvalidate", ["make"], function () {
  return gulp.src("output/**/*.js")
    .pipe(plumber())
    .pipe(jsvalidate());
});

gulp.task("docs", function () {
  return gulp.src("src/**/*.purs")
    .pipe(plumber())
    .pipe(purescript.pscDocs())
    .pipe(gulp.dest("docs/MODULE.md"));
});

gulp.task("dotpsci", function () {
  return gulp.src(paths)
    .pipe(plumber())
    .pipe(purescript.dotPsci());
});

gulp.task("default", ["jsvalidate", "docs", "dotpsci"]);
