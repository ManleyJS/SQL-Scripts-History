
USE ROLE useradmin;

create USER terraform_infrastructure_setup
LOGIN_NAME = terraform.infrastructure.setup
email = 'jonathan.manley@bourne-leisure.co.uk'
display_name = 'Terrafrom Infrastructure Setup'
comment = 'Terrafrom Infrastructure Setup Account'
rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7hrO1u2L4vs13IIp9UX2
eXSFM4Rcfgsjl32mV5MHhIeWakH1EJdWkqd7KIaef98xgyLAGms16izQDxdScF9g
QNBhPxfpOibSShB5aQjSOGcuvs451qtvHF8KAivzBTgwLAyktIo/2ypa6xjUajtF
XPRrHpQZ8+Ax/SdxLuqAZWwb3pLAY7ue9UuQ+MRgz91t/jPPPayrsxnKaCi7XDCV
L5lXAx4gDynYzpj+7G7uRBzCrzp149vyYC2l6M6MKnV0CPcEMzRjHT5fsdp/u+iv
Yk5M1i1PcmSY1iDcBmza5Y36SjOYXX3VchjomXFzGqaucHIcapDBc2SP4abZaK4M
ewIDAQAB'
default_role = accountadmin;

USE ROLE securityadmin;
GRANT ROLE accountadmin TO USER terraform_infrastructure_setup;
 
USE ROLE useradmin;

alter USER terraform_infrastructure_setup
SET rsa_public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxQo2LKhAMDk13zn5RWBx
VxNnVndeQT0MFrYi5dTXT1vsBS8U219JsnUnuang6eJH0Q0opae2tHHk9GYsKzl1
Zn+pTJIAlkyNYxbNPo3gFn44AN6nFEuQDv7K7PElX2On/v/5xpHEAsFs+g7louhp
TcERLh/kNOJZUt2e5U7wyG1WON2w2eh341ico4VqyhQ+YDK4mBaiZrB+KYs2KxSr
n78HiK+tIuwVvtbmsbQasJpnCFXArK92DEpcnxuJ4lYg0N1Zj6w51tZvBMbonexB
TL/nL5WhJJu2UV5WAqr6AxxIWfgy2MlF2r/omQ3HO8FUrhYSqdJaBruuZ2SvDbTP
nQIDAQAB'; 
