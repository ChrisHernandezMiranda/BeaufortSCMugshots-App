import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css'; 
import './Buttons.css';  // Custom styles

const Buttons = ({ onTimeFrameChange }) => {
  return (
    <div className="buttons-container">
      {timeFrames.map((timeFrame) => (
        <button
          key={timeFrame.value}
          className="buttons__btn btn btn-outline-black flex-fill mx-1"
          onClick={() => onTimeFrameChange(timeFrame.value)}
          onMouseEnter={(e) => (e.target.classList.add("buttons__btn-hover"))}
          onMouseLeave={(e) => (e.target.classList.remove("buttons__btn-hover"))}
        >
          {timeFrame.label.split('\n').map((line, index) => (
            <span key={index}>{line}<br /></span> // Add line breaks
          ))}
        </button>
      ))}
    </div>
  );
};

// Define time frames in an array for easier management
const timeFrames = [
  { value: 'last24hours', label: 'View Last\n24 Hours' },
  { value: 'last72hours', label: 'View Last\n72 Hours' },
  { value: 'last15days', label: 'View Last\n15 Days' },
  { value: 'last90days', label: 'View Last\n90 Days' },
];

export default Buttons;
