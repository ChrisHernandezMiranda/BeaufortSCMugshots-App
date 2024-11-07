
import React, { useState } from 'react';
import TopContent from './components/TopContent';
import Buttons from './components/Buttons';
import InmateGrid from './components/InmateGrid';
import InmateModal from './components/InmateModal';
import useFetchInmates from './customHooks/useInmate';
import Footer from './components/Footer';
import './Home.css'; 

const Home = () => {
    const [selectedTimeFrame, setSelectedTimeFrame] = useState('last24hours');  // Default to 24 hours
    const { inmates, loading, error } = useFetchInmates();
    const [searchTerm, setSearchTerm] = useState('');
    const [filter, setFilter] = useState('');
    const [selectedInmate, setSelectedInmate] = useState(null);

    const filterDisplayText = {
        last24hours: "24 Hours",
        last72hours: "72 Hours",
        last15days: "15 Days",
        last90days: "90 Days"
    };

    const timeFrameThresholds = {
        last24hours: 24 * 60 * 60 * 1000,
        last72hours: 72 * 60 * 60 * 1000,
        last15days: 15 * 24 * 60 * 60 * 1000,
        last90days: 0,
    };

    const now = new Date();
    const thresholdDate = new Date(now.getTime() - timeFrameThresholds[selectedTimeFrame]);

    const createDateTime = (dateStr, timeStr) => {
        if (!dateStr || !timeStr) return null;
        const date = new Date(dateStr);
        const [hours, minutes] = timeStr.split(':').map(Number);
        date.setUTCHours(hours, minutes, 0, 0);
        return date;
    };

    const filteredInmates = () => {
        let result = selectedTimeFrame === 'last90days' ? inmates : inmates.filter(inmate => {
            const bookingDate = createDateTime(inmate.booked_date, inmate.booked_time);
            const releaseDate = createDateTime(inmate.release_date, inmate.release_time);

            const withinBookingRange = bookingDate && bookingDate >= thresholdDate && bookingDate <= now;
            const withinReleaseRange = releaseDate && releaseDate >= thresholdDate && releaseDate <= now;

            return withinBookingRange || withinReleaseRange;
        });

        if (searchTerm) {
            const lowerCaseSearchTerm = searchTerm.toLowerCase();
            result = result.filter(inmate => {
                const fullName = `${inmate.first_name} ${inmate.last_name}`.toLowerCase();
                return fullName.includes(lowerCaseSearchTerm);
            });
        }

        if (filter === 'dateBookedAsc') {
            result.sort((a, b) => new Date(a.booked_date) - new Date(b.booked_date));
        } else if (filter === 'dateBookedDesc') {
            result.sort((a, b) => new Date(b.booked_date) - new Date(a.booked_date));
        } else if (filter === 'lastNameAsc') {
            result.sort((a, b) => a.last_name.localeCompare(b.last_name));
        } else if (filter === 'lastNameDesc') {
            result.sort((a, b) => b.last_name.localeCompare(a.last_name));
        }

        return result;
    };

    const handleInmateClick = (inmate) => {
        setSelectedInmate(inmate);
    };

    const closeModal = () => {
        setSelectedInmate(null);
    };

    const lastUpdatedTime = filteredInmates().length > 0 
        ? new Date(Math.max(...filteredInmates().map(inmate => new Date(inmate.last_updated)))).toLocaleString()
        : '';

    // Reset handler for the logo click (reset time frame, search, and filter)
    const resetFiltersAndSearch = () => {
        setSearchTerm('');
        setFilter('');
        setSelectedTimeFrame('last24hours');
    };

    return (
        <div className="app-wrapper">
            <main className="content">
                <TopContent 
                    onSearchChange={setSearchTerm} 
                    onFilterChange={setFilter} 
                    onReset={resetFiltersAndSearch} // Pass reset function to TopContent
                />
                <Buttons onTimeFrameChange={setSelectedTimeFrame} />
                <InmateGrid
                    inmates={filteredInmates()} 
                    loading={loading}
                    error={error}
                    selectedFilter={filter}
                    lastUpdatedTime={lastUpdatedTime}
                    filterDisplayText={filterDisplayText} 
                    selectedTimeFrame={selectedTimeFrame}  
                    onInmateClick={handleInmateClick}
                />
                {selectedInmate && (
                    <InmateModal 
                        inmate={selectedInmate} 
                        onClose={closeModal} 
                    />
                )}
            </main>
            <Footer />
        </div>
    );
};

export default Home;
