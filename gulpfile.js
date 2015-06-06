/* jshint node: true */
"use strict";

var gulp = require("gulp");
var plumber = require("gulp-plumber");
var purescript = require("gulp-purescript");

var sources = [
  "src/**/*.purs",
  "bower_components/purescript-*/src/**/*.purs"
];

var foreigns = [
  "bower_components/purescript-*/src/**/*.js"
];

gulp.task("make", function() {
  return gulp.src(sources)
    .pipe(plumber())
    .pipe(purescript.pscMake({ ffi: foreigns }));
});

gulp.task("docs", function () {
  return gulp.src(sources)
    .pipe(plumber())
    .pipe(purescript.pscDocs({
      docgen: {
        "Control.Alt": "docs/Control.Alt.md",
        "Control.Alternative": "docs/Control.Alternative.md",
        "Control.Apply": "docs/Control.Apply.md",
        "Control.Bind": "docs/Control.Bind.md",
        "Control.Comonad": "docs/Control.Comonad.md",
        "Control.Extend": "docs/Control.Extend.md",
        "Control.Lazy": "docs/Control.Lazy.md",
        "Control.Monad": "docs/Control.Monad.md",
        "Control.MonadPlus": "docs/Control.MonadPlus.md",
        "Control.Plus": "docs/Control.Plus.md",
        "Data.Functor": "docs/Data.Functor.md"
      }
    }));
});

gulp.task("dotpsci", function () {
  return gulp.src(sources)
    .pipe(plumber())
    .pipe(purescript.dotPsci());
});

gulp.task("default", ["make", "docs", "dotpsci"]);
