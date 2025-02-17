const baseUrl = 'https://f869-89-38-99-102.ngrok-free.app/'; //base_url

const authUrl = '${baseUrl}auth';
const loginUrl = '$authUrl/authenticate';
const userRegisterUrl = '$authUrl/register/user';
const archRegisterUrl = '$authUrl/register/architect';
const postsUrl = '${baseUrl}posts/all';

//profile

const getProfileUrl = '${baseUrl}users';

//blance
const balanceUrl = '${baseUrl}balance';

//follow
const addFollowUrl = '${baseUrl}api/followers/add';
