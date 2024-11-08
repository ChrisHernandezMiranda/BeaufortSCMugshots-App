import React from 'react';
import PropTypes from 'prop-types';
import './InmateModal.css';
import 'bootstrap/dist/css/bootstrap.min.css'; 
import defaultImage from '../assets/mugshot-generic.png';

const InmateModal = ({ inmate, onClose }) => {
    if (!inmate) return null;

    const offenses = inmate.arrests.length > 0 ? inmate.arrests[0].offenses : [];

    const handleOverlayClick = (e) => {
        if (e.target === e.currentTarget) {
            onClose();
        }
    };

    return (
        <div className="inmate-modal__overlay" onClick={handleOverlayClick}>
            <div className="inmate-modal__content">
                <button className="inmate-modal__close-button" onClick={onClose}>&times;</button>
                
                <h2 className="inmate-modal__title">{`${inmate.first_name} ${inmate.last_name}`}</h2>
                <img
    src={inmate.mugshot_url ? `https://beaufort-sc-mugshots-31136acff250.herokuapp.com/proxy-image?url=${encodeURIComponent(inmate.mugshot_url)}` : defaultImage}
    alt={`${inmate.first_name} ${inmate.last_name}`}
    className="inmate-modal__image"
    onError={(e) => { e.target.src = defaultImage; }}
/>

                {offenses.length > 0 ? (
                    <table className="inmate-modal__table table table-responsive">
                        <thead>
                            <tr>
                                <th>Statute</th>
                                <th>Bond</th>
                                <th>Offense</th>
                            </tr>
                        </thead>
                        <tbody>
                            {offenses.map((offense, index) => (
                                <tr key={index}>
                                    <td>{offense.offense_code}</td>
                                    <td>{offense.bond_amount}</td>
                                    <td>{offense.offense_location}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                ) : (
                    <p>No charges found.</p>
                )}

                <div className="inmate-modal__grid-container container">
                    <div className="row">
                        <div className="col-6 inmate-modal__grid-item"><strong>Booking Date:</strong> {new Date(inmate.booked_date).toLocaleDateString()}</div>
                        <div className="col-6 inmate-modal__grid-item"><strong>Booking Time:</strong> {inmate.booked_time}</div>
                        <div className="col-6 inmate-modal__grid-item"><strong>Release Date:</strong> {inmate.release_date ? new Date(inmate.release_date).toLocaleDateString() : 'N/A'}</div>
                        <div className="col-6 inmate-modal__grid-item"><strong>Release Time:</strong> {inmate.release_time || 'N/A'}</div>
                        <div className="col-6 inmate-modal__grid-item"><strong>Street Address:</strong> {inmate.street}</div>
                        <div className="col-6 inmate-modal__grid-item"><strong>City/State/ZIP:</strong> {inmate.city_state_zip}</div>
                        <div className="col-6 inmate-modal__grid-item"><strong>Race/Gender:</strong> {inmate.race_gender}</div>
                        <div className="col-6 inmate-modal__grid-item"><strong>Height:</strong> {inmate.height}</div>
                        <div className="col-6 inmate-modal__grid-item"><strong>Weight:</strong> {inmate.weight}</div>
                        <div className="col-6 inmate-modal__grid-item"><strong>Booking Number:</strong> {inmate.booking_number}</div>
                        <div className="col-6 inmate-modal__grid-item"><strong>Arrest Agency:</strong> {inmate.arrests[0]?.arrest_agency || 'N/A'}</div>
                        <div className="col-6 inmate-modal__grid-item"><strong>Arrest Officer:</strong> {inmate.arrests[0]?.arrest_officer || 'N/A'}</div>
                        <div className="col-6 inmate-modal__grid-item"><strong>Date of Birth:</strong> {inmate.date_of_birth ? new Date(inmate.date_of_birth).toLocaleDateString() : 'N/A'}</div>
                    </div>
                </div>
            </div>
        </div>
    );
};

InmateModal.propTypes = {
    inmate: PropTypes.shape({
        first_name: PropTypes.string.isRequired,
        last_name: PropTypes.string.isRequired,
        mugshot_url: PropTypes.string,
        date_of_birth: PropTypes.string,
        booked_date: PropTypes.string,
        booked_time: PropTypes.string,
        release_date: PropTypes.string,
        release_time: PropTypes.string,
        street: PropTypes.string,
        city_state_zip: PropTypes.string,
        race_gender: PropTypes.string,
        height: PropTypes.string,
        weight: PropTypes.string,
        booking_number: PropTypes.string,
        arrests: PropTypes.arrayOf(
            PropTypes.shape({
                arrest_agency: PropTypes.string,
                arrest_officer: PropTypes.string,
                offenses: PropTypes.arrayOf(
                    PropTypes.shape({
                        offense_code: PropTypes.string,
                        offense_description: PropTypes.string,
                        bond_amount: PropTypes.string,
                        offense_location: PropTypes.string,
                    })
                ),
            })
        ),
    }),
    onClose: PropTypes.func.isRequired,
};

export default InmateModal;
