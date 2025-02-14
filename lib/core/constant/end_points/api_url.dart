const baseUrl = 'https://e460-149-34-244-131.ngrok-free.app/'; //base_url

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
