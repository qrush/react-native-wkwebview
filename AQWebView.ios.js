var React = require('react-native');
var { requireNativeComponent } = React;

class WKWebView extends React.Component {
  render() {
    return <AQWebView {...this.props} />;
  }
}

WKWebView.propTypes = {
  url: React.PropTypes.string,
  automaticallyAdjustContentInsets: React.PropTypes.bool,
  contentInset: React.PropTypes.shape({
     top: React.PropTypes.number,
     left: React.PropTypes.number,
     bottom: React.PropTypes.number,
     right: React.PropTypes.number
  }),
};

var AQWebView = requireNativeComponent('AQWebView', WKWebView);

module.exports = WKWebView;
