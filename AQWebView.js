'use strict';

var { requireNativeComponent } = require('react-native');

// requireNativeComponent automatically resolves this to "AQWebViewManager"
module.exports = requireNativeComponent('AQWebView', null);
