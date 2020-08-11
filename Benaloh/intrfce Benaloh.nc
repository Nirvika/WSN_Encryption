/*      Interface for the Benaloh cipher in TinyOS.*/

interface Benaloh{

/** Encryption of paintext
 * parameter as input
 * key use to encrypt
 * output ,ciphertext 
*/

command uint32_t encrypt(uint32_t in, uint32_t y, uint32_t p, uint32_t q, uint32_t out);
 
/** Decryption of ciphertext
 * parameter as input
 * key use to decrypt
 * output ,plaintext 
*/

 command uint32_t decrypt(uint32_t in,uint32_t y, uint32_t p, uint32_t q, uint32_t out);

}


