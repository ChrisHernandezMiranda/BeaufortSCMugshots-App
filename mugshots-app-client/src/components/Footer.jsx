// src/components/Footer.jsx
import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css'; 
const Footer = () => {
  return (
    <footer className="footer bg-light text-center py-4">
      <p className="mb-2">&copy; 2024 BeaufortMugShots</p>
      <button
        className="btn btn-outline-primary"
        onClick={() => window.location.href = 'mailto:HernandezMirandaChris@gmail.com'}
      >
        Contact Us
      </button>
    </footer>
  );
};

export default Footer;
