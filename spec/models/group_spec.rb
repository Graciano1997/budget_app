require 'rails_helper'

RSpec.describe Group, type: :model do
    context "Instance of a Model" do
    it "Expect to be an instance of Group" do
        group=Group.new
        expect(group).to be_an_instance_of(Group)
    end
    end

    context "with invalid params" do
        it "Should not be a valid group with no params" do
            group = Group.new
            expect(group).to_not be_valid
          end

         it "Should not be a valid group with 1 param" do
             group = Group.new
             group.name="computer"
             expect(group).to_not be_valid
           end

         it "Should not be a valid group with 1 param" do
             group = Group.new
             group.icon="💻"
             expect(group).to_not be_valid
           end
          
    end

    context "with Valid params" do
         it "Should save a new group wit valid params" do
            user=User.new
            user.name="Gra"
            user.email="gracianomanuelhenrique@gmail.com"
            user.password="12345"
            user.save

             group = Group.new
             group.name="computer"
             group.icon="💻"
             group.user=user
             expect(group).to be_valid
           end
    end

    context "Object should contain methods" do
         it "Should have the methods {:name,:icon,:created_at} " do
             group = Group.new
             group.name="computer"
             group.icon="💻"
             expect(group).to respond_to(:name,:icon,:created_at)
           end
    end

    describe "Associations" do
        it { should belong_to(:user)}
      end
end