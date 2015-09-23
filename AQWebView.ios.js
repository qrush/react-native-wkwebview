var React = require('react-native');
var { requireNativeComponent } = React;

class WKWebView extends React.Component {
  render() {
    return <AQWebView {...this.props} />;
  }
}

WKWebView.propTypes = {
  url: React.PropTypes.string,
};

var AQWebView = requireNativeComponent('AQWebView', WKWebView);

module.exports = WKWebView;
