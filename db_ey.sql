PGDMP     !    $        	        x            ey    13.1    13.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16571    ey    DATABASE     b   CREATE DATABASE ey WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Guatemala.1252';
    DROP DATABASE ey;
                postgres    false            �           0    0    DATABASE ey    COMMENT     *   COMMENT ON DATABASE ey IS 'ey-challenge';
                   postgres    false    3004            �            1259    16602    persona    TABLE     �   CREATE TABLE public.persona (
    nombre text NOT NULL,
    apellido text NOT NULL,
    phone text,
    email text,
    creado date,
    id_rol smallint,
    "Actualizado" date,
    id_persona integer NOT NULL,
    activo boolean,
    fechnac date
);
    DROP TABLE public.persona;
       public         heap    postgres    false            �            1259    16621    persona_id_persona_seq    SEQUENCE     �   CREATE SEQUENCE public.persona_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.persona_id_persona_seq;
       public          postgres    false    201            �           0    0    persona_id_persona_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.persona_id_persona_seq OWNED BY public.persona.id_persona;
          public          postgres    false    202            �            1259    16594    rol    TABLE     P   CREATE TABLE public.rol (
    rol text NOT NULL,
    id_rol integer NOT NULL
);
    DROP TABLE public.rol;
       public         heap    postgres    false            �            1259    16657    rol_id_rol_seq    SEQUENCE     �   CREATE SEQUENCE public.rol_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.rol_id_rol_seq;
       public          postgres    false    200            �           0    0    rol_id_rol_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.rol_id_rol_seq OWNED BY public.rol.id_rol;
          public          postgres    false    203            +           2604    16623    persona id_persona    DEFAULT     x   ALTER TABLE ONLY public.persona ALTER COLUMN id_persona SET DEFAULT nextval('public.persona_id_persona_seq'::regclass);
 A   ALTER TABLE public.persona ALTER COLUMN id_persona DROP DEFAULT;
       public          postgres    false    202    201            *           2604    16659 
   rol id_rol    DEFAULT     h   ALTER TABLE ONLY public.rol ALTER COLUMN id_rol SET DEFAULT nextval('public.rol_id_rol_seq'::regclass);
 9   ALTER TABLE public.rol ALTER COLUMN id_rol DROP DEFAULT;
       public          postgres    false    203    200            �          0    16602    persona 
   TABLE DATA           }   COPY public.persona (nombre, apellido, phone, email, creado, id_rol, "Actualizado", id_persona, activo, fechnac) FROM stdin;
    public          postgres    false    201   g       �          0    16594    rol 
   TABLE DATA           *   COPY public.rol (rol, id_rol) FROM stdin;
    public          postgres    false    200   �       �           0    0    persona_id_persona_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.persona_id_persona_seq', 5, true);
          public          postgres    false    202            �           0    0    rol_id_rol_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.rol_id_rol_seq', 2, true);
          public          postgres    false    203            /           2606    16656    persona persona_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public            postgres    false    201            -           2606    16667    rol rol_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);
 6   ALTER TABLE ONLY public.rol DROP CONSTRAINT rol_pkey;
       public            postgres    false    200            0           2606    16669    persona persona_id_rol_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.rol(id_rol) ON UPDATE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_id_rol_fkey;
       public          postgres    false    201    200    2861            �   <   x��LL*��t�H�+,����!##]C#]KNC�"��U��O��o
U���� ���      �   "   x�KL����4�J-.)M�L�+I�4����� s�q     