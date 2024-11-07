import React from 'react';
import defaultImage from '../assets/mugshot-generic.png';
import InmateModal from './InmateModal';
import 'bootstrap/dist/css/bootstrap.min.css';
import './InmateGrid.css';


const InmateGrid = ({ inmates, loading, error, selectedFilter, lastUpdatedTime, filterDisplayText, selectedTimeFrame, onInmateClick }) => {
    if (loading) return <div className="text-center fs-4 my-3">Loading...</div>;
    if (error) return <div className="text-center text-danger fs-5 my-3">Error: {error}</div>;
    if (!inmates || inmates.length === 0) {
        return <div className="text-center fs-4 my-3">No inmates found.</div>;
    }

    const totalInmates = inmates.length;

    return (
        <div className="container my-4">
            <h2 className="text-center mb-3">Booked / Released Last {filterDisplayText[selectedTimeFrame] || "Unavailable"}</h2>
            <p className="text-center text-muted">Last updated: {lastUpdatedTime}</p>
            <p className="text-center">Total: {totalInmates}</p>

            <p className="text-center text-muted small">
                *Not associated with Beaufort County. For official information, please click{" "}
                <a
                    href="https://www.beaufortcountysc.gov/detention-center/inmate-inquiry-system.html"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-primary text-decoration-underline"
                >
                    here
                </a>.
            </p>

            {/* Updated grid structure */}
            <div className="row row-cols-3 row-cols-md-4 row-cols-lg-6 row-cols-xl-8 g-3">
                {inmates.map((inmate) => (
                    <div key={inmate.inmate_id} className="col">
                        <div
                            className="card h-100 text-center shadow-sm"
                            onClick={() => onInmateClick(inmate)}
                            style={{ cursor: 'pointer' }}
                        >
                            <img
                                src={inmate.mugshot_url || defaultImage}
                                alt={inmate.first_name || 'Inmate'}
                                className="card-img-top"
                                onError={(e) => { e.target.src = defaultImage; }}
                                style={{ borderRadius: '8px' }}
                            />
                            <div className="card-body">
                                <h5 className="card-title mb-0 inmate-name">{`${inmate.first_name} ${inmate.last_name}`}</h5>
                            </div>
                        </div>
                    </div>
                ))}
            </div>
        </div>
    );
};

export default InmateGrid;
