
import React, { useState } from 'react';
import logo from '../assets/logo.svg'; 
import 'bootstrap/dist/css/bootstrap.min.css'; 
import './TopContent.css';

const TopContent = ({ onSearchChange, onFilterChange, onReset }) => {  
  const [searchTerm, setSearchTerm] = useState('');
  const [filter, setFilter] = useState('');

  const handleSearchChange = (e) => {
    const value = e.target.value;
    setSearchTerm(value);
    onSearchChange(value);
  };

  const handleFilterChange = (e) => {
    const value = e.target.value;
    setFilter(value);
    onFilterChange(value);
  };

  // Call the reset function passed as a prop when the logo is clicked
  const handleLogoClick = () => {
    setSearchTerm('');
    setFilter('');
    onSearchChange('');
    onFilterChange('');
    onReset(); // Reset the time frame to "last24hours" (or other default logic)
  };

  return (
    <div className="top-content-container d-flex align-items-center justify-content-between p-3 bg-white">
      {/* Clickable logo that resets everything */}
      <img 
        src={logo} 
        alt="Logo" 
        className="logo" 
        onClick={handleLogoClick}  // Attach click handler
      />
      
      {/* Bootstrap input group to combine the search input and filter dropdown */}
      <div className="input-group search-filter-group">
        <input
          type="text"
          className="form-control search-input"
          placeholder="Search inmates"
          value={searchTerm}
          onChange={handleSearchChange}
        />
        <select
          className="form-select filter-select"
          value={filter}
          onChange={handleFilterChange}
        >
          <option value="">Filter...</option>
          <option value="dateBookedAsc">Date Booked (Ascending)</option>
          <option value="dateBookedDesc">Date Booked (Descending)</option>
          <option value="lastNameAsc">Last Name (A-Z)</option>
          <option value="lastNameDesc">Last Name (Z-A)</option>
        </select>
      </div>
    </div>
  );
};

export default TopContent;
