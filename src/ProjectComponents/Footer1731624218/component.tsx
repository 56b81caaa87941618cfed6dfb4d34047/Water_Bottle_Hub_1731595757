import React from 'react';

const Footer: React.FC = () => {
  return (
    <footer className="bg-gray-800 text-white p-8 w-full h-full"> {/* Full width and height */}
      <div className="container mx-auto h-full">
        <div className="flex flex-wrap justify-between h-full">
          
          {/* FOOTER COPY */}
          <div className="w-full md:w-1/3 mb-6 md:mb-0">
            <h3 className="text-xl font-bold mb-2">AquaVessel</h3>
            <p className="text-gray-400">© 2023 AquaVessel. Stay hydrated, stay sustainable.</p>
          </div>

          {/* QUICK LINKS */}
          <div className="w-full md:w-1/3 mb-6 md:mb-0">
            <h4 className="text-lg font-semibold mb-2">Quick Links</h4>
            <ul className="text-gray-400">
              <li><a href="#" className="hover:text-white">Home</a></li>
              <li><a href="#" className="hover:text-white">Products</a></li>
              <li><a href="#" className="hover:text-white">About Us</a></li>
              <li><a href="#" className="hover:text-white">Contact</a></li>
            </ul>
          </div>

          {/* IMAGE */}
          <div className="w-full md:w-1/3 mb-6 md:mb-0 flex justify-center items-center">
            <img src="/path-to-your-image.jpg" alt="AquaVessel" className="max-w-full h-auto rounded-lg shadow-md" />
          </div>

          {/* CONNECT WITH US */}
          <div className="w-full md:w-1/3 mb-6 md:mb-0">
            <h4 className="text-lg font-semibold mb-2">Connect with Us</h4>
            <div className="flex space-x-4">
              <a href="#" className="text-gray-400 hover:text-white"><i className='bx bxl-facebook'></i></a>
              <a href="#" className="text-gray-400 hover:text-white"><i className='bx bxl-twitter'></i></a>
              <a href="#" className="text-gray-400 hover:text-white"><i className='bx bxl-instagram'></i></a>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
};

export { Footer as component };