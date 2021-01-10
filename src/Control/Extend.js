"use strict";

exports.arrayExtend = function(f) {
  return function(xs) {
    return xs.map(function (_, i) {
      return f(xs.slice(i));
    });
  };
};
