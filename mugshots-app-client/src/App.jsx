// src/App.jsx
import React from 'react';
import { BrowserRouter } from 'react-router-dom'; // Import BrowserRouter
import Home from './Home';
import 'bootstrap/dist/css/bootstrap.min.css';

const App = () => {
  return (
    <BrowserRouter> {/* Wrap your app with BrowserRouter */}
      <Home />
    </BrowserRouter>
  );
};

export default App;
