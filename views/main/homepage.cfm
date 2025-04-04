<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Address_Book_Home_Page</title>
        <link rel="stylesheet" href="./Bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="./Style/style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body> 
        <cfoutput>
            <div class="modal fade " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog ">
                    <div class=" editModal modal-content">
                        <div class="d-flex">
                            <div class="ms-3 modalMainBody">
                                <div class="text-center">
                                    <div class="contactModalHead mx-auto">CONTACT DETAILS</div>
                                </div>
                                <div>
                                    <div class="profileEachDataDiv ">
                                        <div class="modalProfileHead">Name</div>
                                        <div class="modalColon">&colon;</div>
                                        <div class="modalProfileData" id="viewModalName"></div>
                                    </div>
                                    <div class="profileEachDataDiv ">
                                        <div class="modalProfileHead">Gender</div>
                                        <div class="modalColon">&colon;</div>
                                        <div class="modalProfileData" id="viewModalGender"></div>
                                    </div>
                                    <div class="profileEachDataDiv ">
                                        <div class="modalProfileHead">Date of Birth</div>
                                        <div class="modalColon">&colon;</div>
                                        <div class="modalProfileData" id="viewModalDate"></div>
                                    </div>
                                    <div class="profileEachDataDiv ">
                                        <div class="modalProfileHead">Adress</div>
                                        <div class="modalColon">&colon;</div>
                                        <div class="modalProfileData" id="viewModalAddress">    
                                        </div>
                                    </div>
                                    <div class="profileEachDataDiv ">
                                        <div class="modalProfileHead">Pincode</div>
                                        <div class="modalColon">&colon;</div>
                                        <div class="modalProfileData" id="viewModalPincode"></div>
                                    </div>
                                    <div class="profileEachDataDiv ">
                                        <div class="modalProfileHead">Email Id</div>
                                        <div class="modalColon">&colon;</div>
                                        <div class="modalProfileData" id="viewModalEmail"></div>
                                    </div>
                                    <div class="profileEachDataDiv ">
                                        <div class="modalProfileHead">Phone</div>
                                        <div class="modalColon">&colon;</div>
                                        <div class="modalProfileData" id="viewModalPhone"></div>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <button type="button py-3" class="modalBtnClose " data-bs-dismiss="modal" aria-label="Close">CLOSE</button>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center w-25 pt-5">
                                <div class="">
                                    <img height="100" class="mt-5" id="viewModalProfilePic" src="./Assets/Images/addressProfilePic.jpeg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="staticBackdropEdit" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog ">
                    <div class=" editMainModal modal-content">
                        <div class="d-flex">
                            <div class="ms-3 modalEditMainBody">
                                <div class="editModalContent mx-auto">
                                    <div class="text-center">
                                        <div class="contactEditModalHead mx-auto" id="createContactHead">CREATE CONTACT</div>
                                    </div>
                                    <form id="createContactForm" action="" method="POST" enctype="multipart/form-data">
                                        <div>
                                            <div class="mb-3 personalDetailsHead">Personal Contact</div>
                                        </div>
                                        <div class="d-flex justify-content-between mb-3">
                                            <div class="createContactFields">Title <span>*</span></div>
                                            <div class="createContactFields">First Name <span>*</span></div>
                                            <div class="createContactFields">Last Name <span>*</span></div>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <select name="selectTitle" id="selectTitleId" class="editContactPersonalInput">
                                                    <option value="" selected hidden></option>
                                                    <option value="Mr">Mr</option>
                                                    <option value="Ms">Ms</option>
                                                </select>
                                                <div id="titleWarning" class="registerWarning"></div>
                                            </div>
                                            <div>
                                                <input name="firstName" id="firstNameId" class="editContactPersonalInput nameFields" placeholder="First Name" type="text">
                                                <div id="firstWarning" class="registerWarning"></div>
                                            </div>
                                            <div>
                                                <input name="lastName" id="lastNameId" class="editContactPersonalInput nameFields" placeholder="Last Name" type="text">
                                                <div id="lastWarning" class="registerWarning"></div>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between mb-3 mt-3">
                                            <div class="createContactFields">Gender <span>*</span></div>
                                            <div class="createContactFields">Date Of Birth <span>*</span></div>
                                        </div>
                                        <div class="d-flex justify-content-between mb-3">
                                            <div>
                                                <select name="selectGender" id="selectGenderId" class="editContactPersonalInput">
                                                    <option value="" selected hidden></option>
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                                </select>
                                                <div id="genderWarning" class="registerWarning"></div>
                                            </div>
                                            <div>
                                                <input name="dob" id="dobId" class="editContactPersonalInput" type="date">
                                                <div id="dateWarning" class="registerWarning"></div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="mb-2 createContactFields">Upload Photo </div>
                                        </div>
                                        <div>
                                            <input  type="text" hidden id="hiddenInput" name="hiddenProfilePic" value="./Assets/Images/addressProfilePic.jpeg">
                                            <input name="profilePic" id="profilePicId" class="editContactPersonalInputFile" type="file">
                                            <div id="picWarning" class="registerWarning"></div>
                                        </div>
                                        <div>
                                            <div class="mb-3 mt-2 personalDetailsHead">Contact Details</div>
                                        </div>
                                        <div class="d-flex mb-3 mt-3">
                                            <div class="createContactFields fixWidth">Address<span>*</span></div>
                                            <div class="createContactFields changePosition">Street <span>*</span></div>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <input name="address" id="addressId" class="editContactPersonalInput" placeholder="Address" type="text">
                                                <div id="addressWarning" class="registerWarning"></div>
                                            </div>
                                            <div>
                                                <input name="street" id="streetId" class="editContactPersonalInput" placeholder="Street Name" type="text">
                                                <div id="streetWarning" class="registerWarning"></div>
                                            </div>
                                        </div>
                                        <div class="d-flex mb-3 mt-3">
                                            <div class="createContactFields fixWidth">District <span>*</span></div>
                                            <div class="createContactFields changePosition">State <span>*</span></div>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <input name="district" id="districtId"  class="editContactPersonalInput" placeholder="District" type="text">
                                                <div id="districtWarning" class="registerWarning"></div>
                                            </div>
                                            <div>
                                                <input name="state" id="stateId" class="editContactPersonalInput" placeholder="State" type="text">
                                                <div id="stateWarning" class="registerWarning"></div>
                                            </div>
                                        </div>
                                        <div class="d-flex mb-3 mt-3">
                                            <div class="createContactFields fixWidth">Country <span>*</span></div>
                                            <div class="createContactFields changePosition">Pincode <span>*</span></div>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <input name="country" id="countryId" class="editContactPersonalInput" placeholder="Country" type="text">
                                                <div id="countryWarning" class="registerWarning"></div>
                                            </div>
                                            <div>
                                                <input name="pincode" id="pincodeId" class="editContactPersonalInput" placeholder="Pin-Code" type="text">
                                                <div id="pincodeWarning" class="registerWarning"></div>
                                            </div>
                                        </div>
                                        <div class="d-flex mb-3 mt-3">
                                            <div class="createContactFields fixWidth">Email Id <span>*</span></div>
                                            <div class="createContactFields changePosition">Phone <span>*</span></div>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <input name="emailId" id="emailIds" class="editContactPersonalInput" placeholder="Email Id" type="text">
                                                <div id="emailWarning" class="registerWarning"></div>
                                            </div>
                                            <div>
                                                <input name="phone" id="phoneId" class="editContactPersonalInput" placeholder="Phone" type="text">
                                                <div id="phoneWarning" class="registerWarning"></div>
                                            </div>
                                        </div>
                                        <div class="text-center mt-4">
                                            <button onclick="return addContact()" id="createSubmitId" type="submit" name="createSubmit" class="modalBtnClose">SUBMIT</button>
                                            <div id="userWarning" class="text-danger fw-bold mt-3"></div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="w-25">
                                <div class="d-flex justify-content-end mt-4 me-4">
                                    <button class="btn btn-close" onclick="closeModal()"  class="modalBtnClose " data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="d-flex justify-content-center w-100 pt-5">
                                    <div class="w-100">
                                        <img height="100" id="editModalId" class="mt-5 ms-5" src="./Assets/Images/addressProfilePic.jpeg" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-flex accessPageHead justify-content-between py-2">
                <div class="ms-5">
                    <span class="fw-bold">ADDRESS BOOK</span>
                </div>
                <div class="d-flex me-5 align-items-center">
                    <img height="20" src="./Assets/Images/logout.png">
                    <button type="button" onclick="pageLogout()" class="logoutButton ms-2" name="logout">Logout</button>
                </div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10 ">
                    <div class="bg-white mt-3 d-flex justify-content-end rounded align-items-center">                               
                        <div class="py-3"></div>
                    </div>
                    <div class="d-flex mt-3">
                        <div class="me-3">
                            <div class="text-center profileBox pt-3">
                                <img width="100" src="#rc.userDetails.profileImage#" alt="">
                                <div class="profileUserName">#rc.userDetails.name#</div>
                                <button data-bs-toggle="modal" onclick="createContact()" data-bs-target="##staticBackdropEdit" class="rounded createContactbutton px-1 py-1">CREATE CONTACT</button>
                            </div>
                        </div>
                        <div class="userAddedContacts px-2" id="contactsTable">
                            <div class="d-flex userContactsHead py-3">
                                <div class="userContactsName">NAME</div>
                                <div class="userContactsEmail">EMAIL ID</div>
                                <div class="userContactsPhone">PHONE NUMBER</div>
                            </div>
                            <cfloop query="#rc.contactDetails#">
                                <form method="POST">
                                    <div class="d-flex py-4 eachContact" id="#rc.contactDetails.contactId#Div">
                                        <img width="80" height="80" class="contactProfileImage me-4" src="#rc.contactDetails.profileImage#" alt="">
                                        <div class="eachContactName">#rc.contactDetails.firstName &" "& rc.contactDetails.lastName#</div>
                                        <div class="eachContactMail">#rc.contactDetails.emailId#</div>
                                        <div class="eachContactNumber">#rc.contactDetails.phoneNUmber#</div>
                                        <button class="eachContactButton" value="#rc.contactDetails.contactId#"  type="button" onclick="editContact(this)"  data-bs-toggle="modal"  data-bs-target="##staticBackdropEdit">EDIT</button>
                                        <button class="eachContactButton" type="button" value="#rc.contactDetails.contactId#" onclick="deleteContact(this)" >DELETE</button>
                                        <button name="viewContactDetails" value="#rc.contactDetails.contactId#" type="button" onclick="viewModalData(this)" class="eachContactButton" data-bs-toggle="modal" data-bs-target="##staticBackdrop">VIEW</button>
                                    </div>
                                </form>
                            </cfloop>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
        </cfoutput>
        <script src="./JavaScript/script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </body>
</html>