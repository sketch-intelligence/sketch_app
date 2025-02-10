const baseUrl = 'http://192.168.1.90:8080/'; //base_url

const authUrl = '${baseUrl}auth';
const loginUrl = '$authUrl/authenticate';
const userRegisterUrl = '$authUrl/register/user';
const archRegisterUrl = '$authUrl/register/architect';
const postsUrl = '${baseUrl}posts/all';

//profile

const getProfileUrl = '${baseUrl}users';

//blance
const balanceUrl = '${baseUrl}balance';
