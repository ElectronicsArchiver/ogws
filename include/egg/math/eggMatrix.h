#ifndef EGG_MATH_MATRIX_H
#define EGG_MATH_MATRIX_H
#include "types_egg.h"

namespace EGG
{
    struct Matrix34f
    {
        inline Matrix34f() {}
        ~Matrix34f();

        inline void makeZero()
        {
            tbl[0][0] = 0.0f, tbl[0][1] = 0.0f, tbl[0][2] = 0.0f, tbl[0][3] = 0.0f;
            tbl[1][0] = 0.0f, tbl[1][1] = 0.0f, tbl[1][2] = 0.0f, tbl[1][3] = 0.0f;
            tbl[2][0] = 0.0f, tbl[2][1] = 0.0f, tbl[2][2] = 0.0f, tbl[2][3] = 0.0f;
        }

        void makeIdentity();
        void makeQ(const Quatf&);
        void makeS(const Vector3f&);
        void setAxisRotation(const Vector3f &, f32);
        void loadPosMtx(u32);

        f32 tbl[3][4];

        static Matrix34f ident;
    };
}

#endif