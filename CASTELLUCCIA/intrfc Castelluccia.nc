interface Castelluccia{
command int64_t encrypt(int64_t *m, int64_t n, int64_t k, int64_t c);
command int64_t decrypt(int64_t c, int64_t n,int64_t k ,int64_t m);
}
