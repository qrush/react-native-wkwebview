var React = require('react-native');
var { requireNativeComponent } = React;

var EdgeInsetsPropType = require('EdgeInsetsPropType');

class WKWebView extends React.Component {
  render() {
    return <AQWebView {...this.props} />;
  }
}

WKWebView.propTypes = {
  url: React.PropTypes.string,
  automaticallyAdjustContentInsets: PropTypes.bool,
  contentInset: EdgeInsetsPropType,
};

var AQWebView = requireNativeComponent('AQWebView', WKWebView);

module.exports = WKWebView;
