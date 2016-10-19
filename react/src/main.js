import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import RateApp from './components/RateApp'

$(function() {
  ReactDOM.render(
    <RateApp/>,
    document.getElementById('rate')
  );
});
