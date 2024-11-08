
import { useState, useEffect } from 'react';
import axios from 'axios';

const BASE_URL = 'https://beaufort-sc-mugshots-31136acff250.herokuapp.com/inmates'; // Directly point to the inmates endpoint

const useFetchInmates = () => { 
  const [inmates, setInmates] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchInmates = async () => {
      setLoading(true);
      console.log('Fetching from:', BASE_URL); // Log the URL being fetched

      try {
        const response = await axios.get(BASE_URL); // Always fetching from the same endpoint
        console.log(response.data); // Log the response data
        if (Array.isArray(response.data)) {
          setInmates(response.data);
        } else {
          setError('Data format is not correct');
        }
      } catch (err) {
        console.error('Error fetching inmates:', err); // Log error
        setError('Failed to fetch inmate data');
      } finally {
        setLoading(false);
      }
    };

    fetchInmates();
  }, []); // Empty dependency array to fetch once on mount

  return { inmates, loading, error };
};

export default useFetchInmates;
