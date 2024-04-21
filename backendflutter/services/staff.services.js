const staffModel = require('../model/staff.model');

class staffService {
    static async addStaff(staffId, staffname, email, address, phoneNumber) {
        try {
            const newStaff = new staffModel({staffId, staffname, email, address, phoneNumber});
            return await newStaff.save();
        }

        catch (err) {
            throw err;
        }
    };

    static async getStaffDetails() {
        try {
            const staff = await staffModel.find();
            return staff;
        } catch (err) {
            console.error('Error fetching staff details:', err);
            throw err;
        }
    }

    static async deleteStaffById(id) {
        try {
            console.log(`Attempting to delete staff with ID: ${id}`);
            const deletedStaff = await staffModel.findByIdAndDelete(id);

            if (!deletedStaff) {
                console.error(`Staff not found with ID: ${id}`);
                throw new Error('Staff not found');
            }
        

            console.log(`Staff detail deleted successfully with ID: ${id}`);
            return deletedStaff;
        } catch (error) {
            console.error('Error deleting staff:', error);
            throw error;
        }
    }
}

module.exports = staffService;
