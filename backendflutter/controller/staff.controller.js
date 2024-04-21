const staffService = require('../services/staff.services');


exports.staffadd = async (req, res, next) => {
    try {
        const {staffId, staffname, email, address, phoneNumber} = req.body;
        const newStaff = await staffService.addStaff(staffId, staffname, email, address, phoneNumber);
        res.json({status:true, success: "New staff added Successfully"});
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.getStaffDetails = async (req, res, next) => {
    try {
        
        const staff = await staffService.getStaffDetails();
        
        if (!staff) {
            return res.status(404).json({ status: false, message: 'Staff not found' });
        }

        res.json({ status: true, staff });
    } catch (error) {
        console.error('Error fetching staff details:', error);
        return res.status(500).json({ status: false, message: 'Internal Server Error.' });
    }
};

exports.deleteStaff = async (req, res) => {
    try {
        const id = req.params.id;
        console.log(`Attempting to delete staff with ID: ${id}`);
        const deletedStaff = await staffService.deleteStaffById(id);

      
        if (!deletedStaff) {
            return res.status(404).json({ message: 'Staff not found', deletedAppointment: deletedStaff });
        }

        // Send success response
        res.status(200).json({message: 'Staff deleted successfully'});

    } catch (error) {
        res.status(500).json({message: 'Error deleting staff',error: error.message});
    }
};


