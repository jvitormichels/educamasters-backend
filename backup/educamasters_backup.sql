PGDMP                         |            postgres    13.4 (Debian 13.4-1.pgdg100+1) %   14.15 (Ubuntu 14.15-0ubuntu0.22.04.1)     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16722    postgres    DATABASE     \   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE postgres;
                postgres    false            �            1259    16731    ar_internal_metadata    TABLE     �   CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
 (   DROP TABLE public.ar_internal_metadata;
       public         heap    postgres    false            �            1259    17026    course_pages    TABLE     6  CREATE TABLE public.course_pages (
    id bigint NOT NULL,
    course_id integer,
    title character varying,
    "position" integer,
    video character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    file_size double precision
);
     DROP TABLE public.course_pages;
       public         heap    postgres    false            �            1259    17024    course_pages_id_seq    SEQUENCE     |   CREATE SEQUENCE public.course_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.course_pages_id_seq;
       public          postgres    false    205            �           0    0    course_pages_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.course_pages_id_seq OWNED BY public.course_pages.id;
          public          postgres    false    204            �            1259    16741    courses    TABLE     5  CREATE TABLE public.courses (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    end_date timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    thumbnail character varying
);
    DROP TABLE public.courses;
       public         heap    postgres    false            �            1259    16739    courses_id_seq    SEQUENCE     w   CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.courses_id_seq;
       public          postgres    false    203            �           0    0    courses_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;
          public          postgres    false    202            �            1259    16723    schema_migrations    TABLE     R   CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         heap    postgres    false                       2604    17029    course_pages id    DEFAULT     r   ALTER TABLE ONLY public.course_pages ALTER COLUMN id SET DEFAULT nextval('public.course_pages_id_seq'::regclass);
 >   ALTER TABLE public.course_pages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205                       2604    16744 
   courses id    DEFAULT     h   ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);
 9   ALTER TABLE public.courses ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �          0    16731    ar_internal_metadata 
   TABLE DATA           R   COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public          postgres    false    201          �          0    17026    course_pages 
   TABLE DATA           r   COPY public.course_pages (id, course_id, title, "position", video, created_at, updated_at, file_size) FROM stdin;
    public          postgres    false    205   \       �          0    16741    courses 
   TABLE DATA           e   COPY public.courses (id, name, description, end_date, created_at, updated_at, thumbnail) FROM stdin;
    public          postgres    false    203   T"       �          0    16723    schema_migrations 
   TABLE DATA           4   COPY public.schema_migrations (version) FROM stdin;
    public          postgres    false    200   �$       �           0    0    course_pages_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.course_pages_id_seq', 54, true);
          public          postgres    false    204            �           0    0    courses_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.courses_id_seq', 209, true);
          public          postgres    false    202            
           2606    16738 .   ar_internal_metadata ar_internal_metadata_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 X   ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       public            postgres    false    201                       2606    17034    course_pages course_pages_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.course_pages
    ADD CONSTRAINT course_pages_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.course_pages DROP CONSTRAINT course_pages_pkey;
       public            postgres    false    205                       2606    16749    courses courses_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_pkey;
       public            postgres    false    203                       2606    16730 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public            postgres    false    200            �   @   x�K�+�,���M�+�LI-K��/ ���Ltu�,��M�L��,�,M��pK�r��qqq ��_      �   �  x��W�n#�]���� Y��|4٭���عcّ_7� J�eZM�����nd�E�d� � �e���2H��E��=�$��{� Z�y��b�T�v�:����Ӷ���#C�ldM٘�8K�ءl'�$��Dt9��L��w����+�X���|����z�ƺ�82we�jRj��mq�;l�:�]Jc!��ܗ �=��<��M�&m��k��A߹�n*=H(��I�l�d�bL���c�d��� ΄HE�#���w+<C�*��4_!� g��Ǚ``�w�쨰�1c]��И���kLi�fHG��H�Y�҄G<Yb:�U�����L����g�aL�Xpc��TFq��6�bFS��&H�2�2O"N�ض3Rw!s������|�+�֦�����3�v�m�8 x��*s�eL��.7A�%Je�9�i�Z6��B�܁I⩻C2�#�C���؁vpZ�k[�֕�x���[�,ˤ�6A�a�J�F�~&K����~f��'�T7�[�\�&��$O�ȑ��@;�n���s	�g�Da�ĉ䂲M��y�{�i�{l������ކ86���	�����ӔJ)7AR�T�<�2�3|�GK�6u�9�38�Vc =����[�"N��4�	�
�Yĕ�����X��՗ �yn�-uЫ����������x)�]۴#���jk7U���J�M�VNs�0�s1#�|Ｊ�t�'�S:�%���m�I�3��$T
�I ۉuprm�V���[L9���xk����q&1f|�3.3�E<D�sj*;u�&��\�Ci{�� `�r��{��3i��i��pe��i�T���远��ܗO�r��\x	Q�?��D��x�-kӐr~cȱ�LK;�iBN������}�T�;sص��1�n�b�'T�^�%�R�+_(]PD].���oݭA�'Ea��P������MM��O<�p��3�{G́7��s\��.m����$��t�������۲��ؒ4�[���x'�m���a���o�M�/�]c��i��'x�uu�Z$U���c6����UF�LU?%����u���s�o�p/X��5��'+��\�נ�1�`�
��`;1Ay�����
�s䠺7����'\�C�5c7�y�}t�Z�@�PT�U�}Xw�m�?�r�Y���	²�p.0��)�Ε!�*�=)��Z36p27!|p�zP!���8��<6רv�>wo�xk����m�JW�$%Jb��@�o�V���Խs%�DvH������)�k[�+WX|���bI�X˂%�c@#�g��Y���ؐ_ߝ��p��<O�?������~������g�@�C��/�-���3�5~���g�珿����>��������"�9O֮��f�Y�lŋ�p��90r~�OG��?���Ǘ����σ,g�\;��>tX.E�&�����ݓ��#�u⢹y$����w|�aw+V����`<M����L�`�:�����b؃����w�pvxr�Z1<zs4��b>�7���SJ,���÷L��.�X�Ds|��(��Du��;p;��a�1�V��?�>V�����;)|H��,Qކ���PT�UX���y	�	Ňb��)��j<��%�ukL���mQ���}c�4�����U-Tb��y���P��=��B�J��]�_�l�6<Vr�鳌d"�\�(!�؍פx�������r��*1Z	�)�ް�fi����|�%�<��$�3%�$ǗD��wqE�H?,�      �   �  x����n�0�g�)nl	$�_[�,)$�;f9[���D��d}��C�[W�X)GvӠ1l�������$��͍�\g����Eo���iښ:ʎ?���ѝa�ZK�B@X���+Nu� }�Nm��J�,6�3�,�K_�=nq�����A�5m_�����I.������y���gq d�#q�R�a��<�OIQ������n̎,�/!���ݩ�>�w��G��F1Т�q��v�3�3Z�*t��A[9�R����*�Rz����z��20���\��Zݓ^�!��,���1�e�â�E����R�!�"�S���c]k�EkӒV�ޱ���������tƛ{<_!���R�0Ix,N(FS;�&	�ԪSX\0�P���`Z�$�����)I=�C_S�7�>[߀ۘ�~���2��k`?.If2��)	��)iƮ�[���$
��hlX�4���f�؇ DQȉ��Z�Zj��iv5�����=���Q�<�����3G+�'��*|1F~��rFSyVJ�,�/{�\�T�W 5�oؔZ���!�7OD��lI5��O3���w����+y���E{�C!�8
E�r�r������\�>Rg��tl�6[��=�~�%�R��s<$�,E���쁸�p�f�?u�      �   4   x�=ǹ�0 ���D���ρ(�3]�[K{~k�����\�_�Iq �t�     