const baseUrl = 'https://staging-api.rentchicken.net/api/';//base_url

//const baseUrl = 'https://staging-api.winshakes.com/api/'; //staging

/////auth_url////////////
const authUrl = '${baseUrl}auth';

///// home page
const breedsUrl = '${baseUrl}breeds';
const farmsUrl = '${baseUrl}farms';
const trendingStoreUrl = '${baseUrl}stores';
const getEggsByVendorUrl = '${baseUrl}stores';
const chickenUrl = '${baseUrl}chickens';
const eggsUrl = '${baseUrl}eggs';
const myHensUrl = '${baseUrl}chickens/rent/user';
const rentChickenUrl = '${baseUrl}chickens/rent';
const cartUrl = '${baseUrl}cartItems';
const cartInfoUrl = '${baseUrl}cartItems/info';
const chickenCartUrl = '${baseUrl}cartItems/chicken';
const chickenCartInfoUrl = '${baseUrl}cartItems/chickens/info';
const clearWishListUrl = '${baseUrl}wishlists/clear';
const getWishListUrl = '${baseUrl}wishlists';
const getAuthWishUrl = '${baseUrl}wishlists/byUser';
const userAddressUrl = '${baseUrl}userAddresses';
const countriesUrl = '${baseUrl}countries';
const usersUrl = '${baseUrl}users';
const changePasswordUrl = '${baseUrl}auth/changePassword';
const getFarmByLocationUrl = '${baseUrl}locations/nearby';
const pagesUrl = '${baseUrl}pages/1';
const addFarmUrl = '${baseUrl}farms/add';
const addLocationUrl = '${baseUrl}locations';
const getNotificationUrl = '${baseUrl}notifications/byUser';
const reservationsUrl = '${baseUrl}reservations';

//chat

const getAllConversationsLink = '${baseUrl}conversations/ByAuthenticatedUser';
const sendMsgLink = '${baseUrl}messages/send';
const getMessagesLink = '${baseUrl}messages/byConversationId';
const getMessageAttachmentLink = '${baseUrl}messages';
const deleteMsgLink = '${baseUrl}conversations';
const supportMsgLink = '${baseUrl}conversations/support';

////

const shippingOptionUrl = '${baseUrl}shippingOptions';
const faqsUrl = '${baseUrl}faqs';
const ordersUrl = '${baseUrl}orders';
const payNowChickenUrl = '${baseUrl}orders/chicken/confirm';
const deleteChickenCartUrl = '${baseUrl}cartItems/chicken';


const orderByUserUrl = '${baseUrl}orders/byUser';
const orderByVendorsUrl = '${baseUrl}orders';
const confirmEggOrder = '${baseUrl}orders/confirm';
const myEggsUrl = '${baseUrl}stores/user';
// deliver flow
const deliverUrl = '${baseUrl}deliver';
const packagesUrl = '${baseUrl}packages';
const addToStoreUrl = '${baseUrl}eggs/addToStore';
const balanceHistoryUrl = '${baseUrl}balances/byUser';
const balanceUrl = '${baseUrl}balances';
const renewUrl = '${baseUrl}chickens/renew';
const socialAuthUrl = '${baseUrl}auth/social';
const sendVerificationByPhoneUrl = 'verification/sendByPhone';
const confirmVerificationByPhoneUrl = 'verification/confirmByPhone';
const forgetPasswordUrl = 'auth/forgottenPassword';
const fcmTokenUrl = 'users/setFcmToken';
const ratingsUrl = 'ratings';
const authBalanceUrl = 'auth/balance';