--
-- PostgreSQL database dump
--

\restrict Y42PHFzyycqfFMVhNnB0T9MfrOMRdBxssUReZgLe7fiFGv6tcmsq1Z4cL2JJaMf

-- Dumped from database version 15.13 (8f9063c)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_numbers; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.admin_numbers (
    phone_number character varying(20) NOT NULL,
    fonte_key character varying(100)
);


ALTER TABLE public.admin_numbers OWNER TO neondb_owner;

--
-- Name: banner_web; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.banner_web (
    id integer NOT NULL,
    branch_id integer,
    url_banner text,
    is_active boolean,
    sort_order integer
);


ALTER TABLE public.banner_web OWNER TO neondb_owner;

--
-- Name: banner_web_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.banner_web_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banner_web_id_seq OWNER TO neondb_owner;

--
-- Name: banner_web_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.banner_web_id_seq OWNED BY public.banner_web.id;


--
-- Name: branches; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.branches (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(100) NOT NULL,
    domain character varying(255),
    pic integer,
    address text,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    template_web integer,
    is_main_branch boolean,
    kode_paket character varying(20),
    start_at timestamp without time zone,
    end_at timestamp without time zone
);


ALTER TABLE public.branches OWNER TO neondb_owner;

--
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.branches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.branches_id_seq OWNER TO neondb_owner;

--
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.branches_id_seq OWNED BY public.branches.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    category_type character varying(50),
    brand character varying(100),
    sub_name character varying(20),
    is_check_nickname boolean DEFAULT true,
    thumbnail text,
    information text,
    banner_url text,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    is_deleted boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    code character varying(10),
    code_check_nickname character varying(10)
);


ALTER TABLE public.categories OWNER TO neondb_owner;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO neondb_owner;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: environment_variables; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.environment_variables (
    code character varying(20) NOT NULL,
    redis_config text,
    no_admin character varying(20),
    duitku_key character varying(50),
    duitku_merchant character varying(50),
    fonte_key text
);


ALTER TABLE public.environment_variables OWNER TO neondb_owner;

--
-- Name: fees; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.fees (
    id integer NOT NULL,
    reference_name character varying(50),
    fee_amount numeric(10,2),
    fee_percentage numeric(5,2),
    calculation_type character varying(20),
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    method_code integer,
    kode_payment character varying(50)
);


ALTER TABLE public.fees OWNER TO neondb_owner;

--
-- Name: fees_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.fees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fees_id_seq OWNER TO neondb_owner;

--
-- Name: fees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.fees_id_seq OWNED BY public.fees.id;


--
-- Name: flash_sale; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.flash_sale (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    start_at timestamp with time zone NOT NULL,
    end_at timestamp with time zone NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    branch_id integer NOT NULL
);


ALTER TABLE public.flash_sale OWNER TO neondb_owner;

--
-- Name: flash_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.flash_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.flash_sale_id_seq OWNER TO neondb_owner;

--
-- Name: flash_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.flash_sale_id_seq OWNED BY public.flash_sale.id;


--
-- Name: flash_sale_products; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.flash_sale_products (
    id integer NOT NULL,
    flash_sale_id bigint NOT NULL,
    product_id bigint NOT NULL,
    stock_reserved integer NOT NULL,
    stock_sold integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    original_price integer,
    flash_sale_price numeric(10,2),
    thumbnail text
);


ALTER TABLE public.flash_sale_products OWNER TO neondb_owner;

--
-- Name: flash_sale_products_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.flash_sale_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.flash_sale_products_id_seq OWNER TO neondb_owner;

--
-- Name: flash_sale_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.flash_sale_products_id_seq OWNED BY public.flash_sale_products.id;


--
-- Name: form_fields; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.form_fields (
    id integer NOT NULL,
    category_brand character varying(100) NOT NULL,
    field_name character varying(100) NOT NULL,
    field_type character varying(50) NOT NULL,
    field_label character varying(200),
    is_required boolean DEFAULT false,
    field_order integer DEFAULT 0,
    options text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.form_fields OWNER TO neondb_owner;

--
-- Name: form_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.form_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.form_fields_id_seq OWNER TO neondb_owner;

--
-- Name: form_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.form_fields_id_seq OWNED BY public.form_fields.id;


--
-- Name: gallery; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.gallery (
    id integer NOT NULL,
    types character varying(20),
    branch_id integer,
    url text,
    is_active boolean
);


ALTER TABLE public.gallery OWNER TO neondb_owner;

--
-- Name: gallery_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.gallery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gallery_id_seq OWNER TO neondb_owner;

--
-- Name: gallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.gallery_id_seq OWNED BY public.gallery.id;


--
-- Name: list_domain; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.list_domain (
    id integer NOT NULL,
    kode_payment character varying(50),
    name character varying(10),
    price bigint
);


ALTER TABLE public.list_domain OWNER TO neondb_owner;

--
-- Name: list_domain_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.list_domain_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.list_domain_id_seq OWNER TO neondb_owner;

--
-- Name: list_domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.list_domain_id_seq OWNED BY public.list_domain.id;


--
-- Name: list_web_cabang; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.list_web_cabang (
    id integer NOT NULL,
    url text,
    image text
);


ALTER TABLE public.list_web_cabang OWNER TO neondb_owner;

--
-- Name: list_web_cabang_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.list_web_cabang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.list_web_cabang_id_seq OWNER TO neondb_owner;

--
-- Name: list_web_cabang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.list_web_cabang_id_seq OWNED BY public.list_web_cabang.id;


--
-- Name: memberships; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.memberships (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    price bigint NOT NULL,
    role_id integer,
    duration integer,
    benefit text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.memberships OWNER TO neondb_owner;

--
-- Name: memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.memberships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.memberships_id_seq OWNER TO neondb_owner;

--
-- Name: memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.memberships_id_seq OWNED BY public.memberships.id;


--
-- Name: notification_templates; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.notification_templates (
    id integer NOT NULL,
    branch_id integer NOT NULL,
    notification_type character varying(50) NOT NULL,
    via character varying(20) NOT NULL,
    subject_message character varying(100),
    title character varying(150),
    body text NOT NULL,
    variables jsonb,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.notification_templates OWNER TO neondb_owner;

--
-- Name: notification_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.notification_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notification_templates_id_seq OWNER TO neondb_owner;

--
-- Name: notification_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.notification_templates_id_seq OWNED BY public.notification_templates.id;


--
-- Name: packet_features; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.packet_features (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.packet_features OWNER TO neondb_owner;

--
-- Name: packet_features_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.packet_features_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.packet_features_id_seq OWNER TO neondb_owner;

--
-- Name: packet_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.packet_features_id_seq OWNED BY public.packet_features.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.password_resets (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    token_hash text NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_used boolean DEFAULT false,
    used_at timestamp without time zone
);


ALTER TABLE public.password_resets OWNER TO neondb_owner;

--
-- Name: password_resets_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.password_resets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.password_resets_id_seq OWNER TO neondb_owner;

--
-- Name: password_resets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.password_resets_id_seq OWNED BY public.password_resets.id;


--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.payment_methods (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    name text NOT NULL,
    description text,
    image text,
    type character varying(50) NOT NULL,
    min_amount bigint DEFAULT 0 NOT NULL,
    max_amount bigint DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payment_methods OWNER TO neondb_owner;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.payment_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_methods_id_seq OWNER TO neondb_owner;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.payment_methods_id_seq OWNED BY public.payment_methods.id;


--
-- Name: popup_desc; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.popup_desc (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text NOT NULL,
    branch_id integer NOT NULL
);


ALTER TABLE public.popup_desc OWNER TO neondb_owner;

--
-- Name: popup_desc_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.popup_desc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.popup_desc_id_seq OWNER TO neondb_owner;

--
-- Name: popup_desc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.popup_desc_id_seq OWNED BY public.popup_desc.id;


--
-- Name: product_providers; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.product_providers (
    id integer NOT NULL,
    provider_id integer NOT NULL,
    product_code character varying(100),
    provider_price bigint NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    product_id integer NOT NULL,
    is_deleted boolean DEFAULT false,
    custom_price bigint DEFAULT 0
);


ALTER TABLE public.product_providers OWNER TO neondb_owner;

--
-- Name: product_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.product_providers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_providers_id_seq OWNER TO neondb_owner;

--
-- Name: product_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.product_providers_id_seq OWNED BY public.product_providers.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(20) NOT NULL,
    category_brand character varying(100),
    base_price bigint NOT NULL,
    main_provider_id integer,
    description text,
    is_active boolean DEFAULT true,
    is_deleted boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    type character varying(10),
    margin_amount bigint DEFAULT 0,
    margin_percentage numeric(5,2) DEFAULT 4,
    calculation_type character varying(10) DEFAULT 'hybrid'::character varying
);


ALTER TABLE public.products OWNER TO neondb_owner;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO neondb_owner;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: providers; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.providers (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(50) NOT NULL,
    api_endpoint text,
    credentials text,
    balance bigint DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    member_id character varying(100),
    pin character varying(20),
    username character varying(50),
    key text
);


ALTER TABLE public.providers OWNER TO neondb_owner;

--
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.providers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.providers_id_seq OWNER TO neondb_owner;

--
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.providers_id_seq OWNED BY public.providers.id;


--
-- Name: register_reseller_transaction; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.register_reseller_transaction (
    id integer NOT NULL,
    reseller_packet_id integer NOT NULL,
    reference_id character varying(100),
    duration integer NOT NULL,
    price bigint NOT NULL,
    discount bigint DEFAULT 0,
    email character varying(255) NOT NULL,
    phone_number character varying(20) NOT NULL,
    method_code character varying(10) NOT NULL,
    method_name character varying(100) NOT NULL,
    payment_payload text,
    status character varying(20) DEFAULT 'pending'::character varying,
    paid_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fee numeric(10,4),
    total bigint,
    template_website integer,
    payment_url text,
    domain_id integer,
    price_addon bigint,
    domain character varying(50)
);


ALTER TABLE public.register_reseller_transaction OWNER TO neondb_owner;

--
-- Name: register_reseller_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.register_reseller_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.register_reseller_transaction_id_seq OWNER TO neondb_owner;

--
-- Name: register_reseller_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.register_reseller_transaction_id_seq OWNED BY public.register_reseller_transaction.id;


--
-- Name: reseller_packet; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.reseller_packet (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    price bigint NOT NULL,
    type_package character varying(10) NOT NULL,
    benefit text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    kode_payment character varying(50),
    discount bigint DEFAULT 0
);


ALTER TABLE public.reseller_packet OWNER TO neondb_owner;

--
-- Name: reseller_packet_features; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.reseller_packet_features (
    id integer NOT NULL,
    packet_code character varying(50) NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    is_enabled boolean DEFAULT true,
    link character varying(255),
    display_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.reseller_packet_features OWNER TO neondb_owner;

--
-- Name: reseller_packet_features_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.reseller_packet_features_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reseller_packet_features_id_seq OWNER TO neondb_owner;

--
-- Name: reseller_packet_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.reseller_packet_features_id_seq OWNED BY public.reseller_packet_features.id;


--
-- Name: reseller_packet_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.reseller_packet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reseller_packet_id_seq OWNER TO neondb_owner;

--
-- Name: reseller_packet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.reseller_packet_id_seq OWNED BY public.reseller_packet.id;


--
-- Name: reseller_pricing; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.reseller_pricing (
    id integer NOT NULL,
    branch_id integer NOT NULL,
    margin_default_amount bigint DEFAULT 0 NOT NULL,
    margin_default_percentage numeric(5,2) DEFAULT 0 NOT NULL,
    calculation_type_admin character varying(20) DEFAULT 'hybrid'::character varying NOT NULL,
    margin_value_amount bigint DEFAULT 0 NOT NULL,
    margin_value_percentage numeric(5,2) DEFAULT 0 NOT NULL,
    calculation_type_reseller character varying(20) DEFAULT 'hybrid'::character varying NOT NULL,
    product_code character varying(10) NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    is_main_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    is_flash_sale boolean DEFAULT false,
    price_flash_sale integer DEFAULT 0,
    start_at timestamp with time zone,
    end_at timestamp with time zone
);


ALTER TABLE public.reseller_pricing OWNER TO neondb_owner;

--
-- Name: reseller_pricing_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.reseller_pricing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reseller_pricing_id_seq OWNER TO neondb_owner;

--
-- Name: reseller_pricing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.reseller_pricing_id_seq OWNED BY public.reseller_pricing.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    phone_number character varying(20),
    content_type character varying(10),
    email character varying(255),
    stars integer DEFAULT 1,
    content text,
    created_at timestamp with time zone,
    branch_id integer NOT NULL
);


ALTER TABLE public.reviews OWNER TO neondb_owner;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO neondb_owner;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    is_deleted boolean DEFAULT true,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.roles OWNER TO neondb_owner;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO neondb_owner;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: sub_categories; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.sub_categories (
    code character varying(20),
    name character varying(50),
    category_brand character varying(100),
    is_active boolean,
    region character varying(20),
    image text
);


ALTER TABLE public.sub_categories OWNER TO neondb_owner;

--
-- Name: transaction_check_nickname; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.transaction_check_nickname (
    id integer NOT NULL,
    ref_id character varying(100) NOT NULL,
    game character varying(100),
    nickname character varying(100),
    response text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    region character varying(20),
    status character varying(10),
    trx_id character varying(10),
    tujuan character varying(100)
);


ALTER TABLE public.transaction_check_nickname OWNER TO neondb_owner;

--
-- Name: transaction_check_nickname_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.transaction_check_nickname_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_check_nickname_id_seq OWNER TO neondb_owner;

--
-- Name: transaction_check_nickname_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.transaction_check_nickname_id_seq OWNED BY public.transaction_check_nickname.id;


--
-- Name: transaction_reseller; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.transaction_reseller (
    id integer NOT NULL,
    branch_id integer NOT NULL,
    reference_id character varying(50) NOT NULL,
    product_code character varying(10) NOT NULL,
    user_id integer,
    tujuan character varying(50) NOT NULL,
    price bigint NOT NULL,
    purchase_price bigint NOT NULL,
    fee numeric(10,2) NOT NULL,
    laba numeric(10,2) NOT NULL,
    total bigint NOT NULL,
    status character varying(50) DEFAULT 'pending'::character varying NOT NULL,
    note text,
    payment_code character varying(10) NOT NULL,
    payment_payload text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    serial_number text,
    phone_number character varying(20),
    trx_id character varying(10),
    product_name character varying(200),
    email character varying(255),
    note_fee character varying(100),
    discount bigint DEFAULT 0
);


ALTER TABLE public.transaction_reseller OWNER TO neondb_owner;

--
-- Name: transaction_reseller_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.transaction_reseller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_reseller_id_seq OWNER TO neondb_owner;

--
-- Name: transaction_reseller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.transaction_reseller_id_seq OWNED BY public.transaction_reseller.id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.transactions (
    id bigint NOT NULL,
    user_id integer,
    amount bigint NOT NULL,
    tujuan character varying(50) NOT NULL,
    nickname character varying(100),
    status character varying(20) DEFAULT 'pending'::character varying NOT NULL,
    profit integer,
    profit_keterangan character varying(255),
    payment_method character varying(50),
    fee bigint DEFAULT 0,
    discount bigint DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    reference_id character varying(50) NOT NULL,
    serial_number character varying(100),
    failed_reason text,
    completed_at timestamp without time zone,
    harga_modal integer NOT NULL,
    total_amount bigint,
    payment_payload text,
    flash_sale_id integer,
    trx_id character varying(50),
    phone_number character varying(20),
    email text,
    note text,
    kode_voucher character varying(100),
    product_id integer NOT NULL
);


ALTER TABLE public.transactions OWNER TO neondb_owner;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

ALTER TABLE public.transactions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_balance_logs; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.user_balance_logs (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    transaction_type character varying(50) NOT NULL,
    amount numeric(15,2) NOT NULL,
    balance_before numeric(15,2) NOT NULL,
    balance_after numeric(15,2) NOT NULL,
    reference_id character varying(100),
    reference_type character varying(50),
    description text,
    created_at timestamp without time zone DEFAULT now(),
    created_by character varying(50)
);


ALTER TABLE public.user_balance_logs OWNER TO neondb_owner;

--
-- Name: user_balance_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.user_balance_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_balance_logs_id_seq OWNER TO neondb_owner;

--
-- Name: user_balance_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.user_balance_logs_id_seq OWNED BY public.user_balance_logs.id;


--
-- Name: user_sessions; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.user_sessions (
    id character varying(100) NOT NULL,
    user_id integer NOT NULL,
    branch_id integer NOT NULL,
    domain character varying(255) NOT NULL,
    ip_address inet,
    user_agent text,
    expires_at timestamp without time zone NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    last_activity timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    session_token text NOT NULL
);


ALTER TABLE public.user_sessions OWNER TO neondb_owner;

--
-- Name: user_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.user_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_sessions_id_seq OWNER TO neondb_owner;

--
-- Name: user_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.user_sessions_id_seq OWNED BY public.user_sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    full_name character varying(200),
    role_id integer NOT NULL,
    branch_id integer NOT NULL,
    is_active boolean DEFAULT true,
    last_login timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_deleted boolean DEFAULT false,
    balance bigint DEFAULT 0,
    phone_number character varying(20)
);


ALTER TABLE public.users OWNER TO neondb_owner;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO neondb_owner;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vouchers; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.vouchers (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    type character varying(20) NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    amount numeric(12,2) NOT NULL,
    percentage numeric(5,2),
    max_discount numeric(12,2),
    min_cart_value numeric(12,2) DEFAULT 0,
    status character varying(20) DEFAULT 'unused'::character varying,
    issued_qty integer NOT NULL,
    used_count integer DEFAULT 0,
    usage_limit integer,
    usage_per_user integer DEFAULT 1,
    valid_from timestamp with time zone NOT NULL,
    valid_until timestamp with time zone NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT vouchers_issued_qty_check CHECK ((issued_qty > 0)),
    CONSTRAINT vouchers_max_discount_check CHECK ((max_discount >= (0)::numeric)),
    CONSTRAINT vouchers_min_cart_value_check CHECK ((min_cart_value >= (0)::numeric)),
    CONSTRAINT vouchers_usage_limit_check CHECK (((usage_limit IS NULL) OR (usage_limit > 0))),
    CONSTRAINT vouchers_used_count_check CHECK ((used_count >= 0))
);


ALTER TABLE public.vouchers OWNER TO neondb_owner;

--
-- Name: vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.vouchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vouchers_id_seq OWNER TO neondb_owner;

--
-- Name: vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.vouchers_id_seq OWNED BY public.vouchers.id;


--
-- Name: web_settings; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.web_settings (
    id integer NOT NULL,
    website_name character varying(200) NOT NULL,
    website_tagline character varying(255),
    website_description text,
    website_keywords text,
    logo_url text,
    logo_dark_url text,
    favicon_url text,
    business_name character varying(200),
    business_address text,
    business_phone character varying(20),
    business_email character varying(100),
    business_hours text,
    url_facebook text,
    url_instagram text,
    url_twitter text,
    url_youtube text,
    url_tiktok text,
    url_whatsapp text,
    whatsapp_number character varying(20),
    whatsapp_message text DEFAULT 'Halo! Saya tertarik dengan produk Anda.'::text,
    url_saluran_whatsapp text,
    footer_text text,
    copyright_text character varying(255),
    show_social_links boolean DEFAULT true,
    show_contact_info boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    branch_id integer
);


ALTER TABLE public.web_settings OWNER TO neondb_owner;

--
-- Name: web_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.web_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.web_settings_id_seq OWNER TO neondb_owner;

--
-- Name: web_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.web_settings_id_seq OWNED BY public.web_settings.id;


--
-- Name: banner_web id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.banner_web ALTER COLUMN id SET DEFAULT nextval('public.banner_web_id_seq'::regclass);


--
-- Name: branches id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.branches ALTER COLUMN id SET DEFAULT nextval('public.branches_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: fees id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.fees ALTER COLUMN id SET DEFAULT nextval('public.fees_id_seq'::regclass);


--
-- Name: flash_sale id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.flash_sale ALTER COLUMN id SET DEFAULT nextval('public.flash_sale_id_seq'::regclass);


--
-- Name: flash_sale_products id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.flash_sale_products ALTER COLUMN id SET DEFAULT nextval('public.flash_sale_products_id_seq'::regclass);


--
-- Name: form_fields id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.form_fields ALTER COLUMN id SET DEFAULT nextval('public.form_fields_id_seq'::regclass);


--
-- Name: gallery id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.gallery ALTER COLUMN id SET DEFAULT nextval('public.gallery_id_seq'::regclass);


--
-- Name: list_domain id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.list_domain ALTER COLUMN id SET DEFAULT nextval('public.list_domain_id_seq'::regclass);


--
-- Name: list_web_cabang id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.list_web_cabang ALTER COLUMN id SET DEFAULT nextval('public.list_web_cabang_id_seq'::regclass);


--
-- Name: memberships id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.memberships ALTER COLUMN id SET DEFAULT nextval('public.memberships_id_seq'::regclass);


--
-- Name: notification_templates id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.notification_templates ALTER COLUMN id SET DEFAULT nextval('public.notification_templates_id_seq'::regclass);


--
-- Name: packet_features id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.packet_features ALTER COLUMN id SET DEFAULT nextval('public.packet_features_id_seq'::regclass);


--
-- Name: password_resets id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.password_resets ALTER COLUMN id SET DEFAULT nextval('public.password_resets_id_seq'::regclass);


--
-- Name: payment_methods id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payment_methods ALTER COLUMN id SET DEFAULT nextval('public.payment_methods_id_seq'::regclass);


--
-- Name: popup_desc id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.popup_desc ALTER COLUMN id SET DEFAULT nextval('public.popup_desc_id_seq'::regclass);


--
-- Name: product_providers id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.product_providers ALTER COLUMN id SET DEFAULT nextval('public.product_providers_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: providers id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.providers ALTER COLUMN id SET DEFAULT nextval('public.providers_id_seq'::regclass);


--
-- Name: register_reseller_transaction id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.register_reseller_transaction ALTER COLUMN id SET DEFAULT nextval('public.register_reseller_transaction_id_seq'::regclass);


--
-- Name: reseller_packet id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.reseller_packet ALTER COLUMN id SET DEFAULT nextval('public.reseller_packet_id_seq'::regclass);


--
-- Name: reseller_packet_features id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.reseller_packet_features ALTER COLUMN id SET DEFAULT nextval('public.reseller_packet_features_id_seq'::regclass);


--
-- Name: reseller_pricing id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.reseller_pricing ALTER COLUMN id SET DEFAULT nextval('public.reseller_pricing_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: transaction_check_nickname id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.transaction_check_nickname ALTER COLUMN id SET DEFAULT nextval('public.transaction_check_nickname_id_seq'::regclass);


--
-- Name: transaction_reseller id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.transaction_reseller ALTER COLUMN id SET DEFAULT nextval('public.transaction_reseller_id_seq'::regclass);


--
-- Name: user_balance_logs id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.user_balance_logs ALTER COLUMN id SET DEFAULT nextval('public.user_balance_logs_id_seq'::regclass);


--
-- Name: user_sessions id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.user_sessions ALTER COLUMN id SET DEFAULT nextval('public.user_sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vouchers id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.vouchers ALTER COLUMN id SET DEFAULT nextval('public.vouchers_id_seq'::regclass);


--
-- Name: web_settings id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.web_settings ALTER COLUMN id SET DEFAULT nextval('public.web_settings_id_seq'::regclass);


--
-- Data for Name: admin_numbers; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.admin_numbers (phone_number, fonte_key) FROM stdin;
+6281535485848	\N
+6282249450631	iXCuMfWrAyzhaiSshCpc
+6282226197047	ubg42AjmdPxz7LMjKHhN
\.


--
-- Data for Name: banner_web; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.banner_web (id, branch_id, url_banner, is_active, sort_order) FROM stdin;
11	4	https://res.cloudinary.com/dikf91ikq/image/upload/v1759733921/mkstore/other/digital-top-up-home-banner_xuwhve.jpg	t	1
12	4	https://res.cloudinary.com/dikf91ikq/image/upload/v1759733921/mkstore/other/digital-top-up-home-banner_xuwhve.jpg	t	2
15	5	https://res.cloudinary.com/dikf91ikq/image/upload/v1759733921/mkstore/other/digital-top-up-home-banner_xuwhve.jpg	t	2
18	5	https://res.cloudinary.com/dikf91ikq/image/upload/v1759733921/mkstore/other/digital-top-up-home-banner_xuwhve.jpg	t	4
2	1	https://res.cloudinary.com/dikf91ikq/image/upload/v1759733921/mkstore/other/digital-top-up-home-banner_xuwhve.jpg	t	2
3	2	https://res.cloudinary.com/dikf91ikq/image/upload/v1759733921/mkstore/other/digital-top-up-home-banner_xuwhve.jpg	t	1
4	2	https://res.cloudinary.com/dikf91ikq/image/upload/v1759733921/mkstore/other/digital-top-up-home-banner_xuwhve.jpg	t	2
5	3	https://res.cloudinary.com/dikf91ikq/image/upload/v1759733921/mkstore/other/digital-top-up-home-banner_xuwhve.jpg	t	2
6	3	https://res.cloudinary.com/dikf91ikq/image/upload/v1759733921/mkstore/other/digital-top-up-home-banner_xuwhve.jpg	t	1
\.


--
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.branches (id, name, code, domain, pic, address, is_active, created_at, updated_at, template_web, is_main_branch, kode_paket, start_at, end_at) FROM stdin;
1	utama	utama	https://udatopup.com	1	jl.kdkdkd	t	2025-09-14 01:30:04.936191	2025-11-01 04:04:30.597137	2	t	PAKETBAS3	2025-09-30 07:12:41.785911	2025-10-10 07:12:41.785911
2	local	local	https://cabang1.udatopup.com	1	kakaajana	t	2025-09-17 12:24:27.531655	2025-11-01 04:04:31.711221	1	t	PAKETBAS3	2025-09-30 07:12:41.785911	2025-11-01 07:12:41.785911
6	cabang	cabang	http://localhost:4321	1	\N	t	2025-10-26 17:02:33.767419	2025-10-26 17:02:33.767419	1	f	PAKETBAS3	2025-09-27 07:12:41.785911	2025-09-28 07:12:41.785911
5	localdev	localdev	http://localhost:3000	1	\N	t	2025-09-30 07:12:41.785911	2025-09-30 07:12:41.785911	1	t	PAKETBAS3	2025-09-30 07:12:41.785911	2025-10-10 07:12:41.785911
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.categories (id, name, category_type, brand, sub_name, is_check_nickname, thumbnail, information, banner_url, sort_order, is_active, is_deleted, created_at, updated_at, code, code_check_nickname) FROM stdin;
68	HAIKYU FLY HIGH	Games	HAIKYU FLY HIGH	Garena	f		Untuk mengetahui User ID Anda<b>Silahkan klik menu profile pada menu utama game<b>User ID akan terlihat disamping Nama Karakter Game Anda	https://res.cloudinary.com/dikf91ikq/image/upload/v1761287468/uploads/uploads/digital-top-up-home-banner.jpg	0	t	f	2025-10-23 19:53:56.899986	2025-10-24 10:41:34.388717	HF	\N
28	testcategory	Games	text category	test category	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1760589590/uploads/uploads/Screenshot%20from%202025-09-07%2020-59-16.png	kakalaka	https://res.cloudinary.com/dikf91ikq/image/upload/v1760591446/uploads/uploads/Screenshot%20from%202025-09-11%2021-03-41.png	0	t	t	2025-10-16 12:14:06.953257	2025-10-16 12:15:22.023573	text	\N
39	AFK Journey	Games	AFK JOURNEY	Farlight Games	f		Klik avatar di pojok kiri atas, account ID dan server Anda berada di pojok kanan bawah halaman pribadi Anda		0	t	f	2025-10-23 13:05:09.549103	2025-10-24 03:40:40.498408	AF	CEKIDAFDC
50	Age of Empires Mobile	Games	Age of Empires Mobile	Level Infinite	f		Untuk mengetahui User ID Anda, silakan klik menu profile dibagian kiri atas pada menu utama game. User ID akan terlihat dibagian bawah Nama Karakter Game Anda.		0	t	f	2025-10-23 13:27:22.488761	2025-10-23 13:27:22.488761	AE	\N
56	Blood Strike	Games	Blood Strike	NetEase	f		Untuk mengetahui User ID Anda, silakan klik menu profile dibagian kiri atas pada menu utama game. User ID akan terlihat dibagian bawah Nama Karakter Game Anda. Silakan masukkan User ID dan Server Anda untuk menyelesaikan transaksi		0	t	f	2025-10-23 19:34:13.46325	2025-10-23 19:34:13.46325	BS	CEKIDBSGL
69	Dunk City Dynasty	Games	Dunk City Dynasty	Netease	f				0	t	f	2025-10-24 15:05:51.452323	2025-10-27 17:30:38.107664	CD	\N
75	Growtopia	Games	GROWTOPIA	Ubisoft	f				0	t	f	2025-10-24 15:09:52.023624	2025-10-24 15:09:52.023624	GW	CEKIDGWMS
71	Cabal Infinite Combo	Games	Cabal Infinite Combo	CBSOFT COMPANY	f				0	t	f	2025-10-24 15:07:40.689775	2025-10-24 15:07:40.689775	CI	\N
73	FOOTBALL RISING STAR	Games	FOOTBALL RISING STAR	AcezMeta	f				0	t	f	2025-10-24 15:09:18.242623	2025-10-24 15:09:18.242623	FR	\N
77	Heaven Burns Red	Games	Heaven Burns Red	Yostar Limited	f				0	t	f	2025-10-24 15:18:17.291863	2025-10-24 15:18:17.291863	HB	\N
81	Kings Choice	Games	Kings Choice	ONEMT	f				0	t	f	2025-10-24 15:20:27.408928	2025-10-24 15:20:27.408928	KC	\N
126	Tarisland	Games	Tarisland	Tencent 	f				0	t	f	2025-10-24 15:41:55.511068	2025-10-24 15:41:55.511068	TA	\N
127	Teamfight Tactics Mobile	Games	Teamfight Tactics Mobile	Riot Games	f				0	t	f	2025-10-24 15:42:21.37775	2025-10-24 15:42:21.377751	TT	\N
129	The Legend of Neverland	Games	The Legend of Neverland	SKYWORK AI	f				0	t	f	2025-10-24 15:43:06.964558	2025-10-24 15:43:06.964558	TL	\N
131	Tower Of Fantasy	Games	Tower Of Fantasy	Hotta Studio	f				0	t	f	2025-10-24 15:46:03.075927	2025-10-24 15:46:03.075927	TO	\N
132	Wuthering Waves	Games	Wuthering Waves	HK KURO GAMES	f				0	t	f	2025-10-24 15:46:26.318699	2025-10-24 15:46:26.3187	WW	\N
133	Zepeto	Games	Zepeto	NAVER Z Corp	f				0	t	f	2025-10-24 15:47:23.163147	2025-10-24 15:47:23.163148	ZP	\N
140	Cherry Credits - Voucher	Voucher	Cherry Credits	Cherry Credits	f				0	t	f	2025-10-24 15:55:30.440585	2025-10-24 18:50:13.38702	CC	\N
139	Bstation - Voucher	Voucher	Bstation	Bilibili	f				0	t	f	2025-10-24 15:54:40.679677	2025-10-24 18:50:16.566922	BS	\N
138	Blizzard - Voucher	Voucher	Blizzard 	Blizzard	f				0	t	f	2025-10-24 15:54:12.975668	2025-10-24 18:50:18.980103	BZ	\N
136	Bigo Live - Voucher	Voucher	Bigo Live	Bigo Technology	f				0	t	f	2025-10-24 15:49:42.028484	2025-10-24 18:50:21.23411	BL	\N
135	Battlenet	Voucher	Battlenet	Battlenet Inc	f				0	t	f	2025-10-24 15:49:02.681302	2025-10-24 18:50:25.616248	BN	\N
22	Point Blank - Voucher	Voucher	Point Blank	ZEPETTO	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1759136022/mkstore/thumbnail_v2/24_yubdbg.png	\nBeli :<br>Masukan User ID<br>Pilih Nominal<br>Pilih Pembayaran<br>Masukan\nNomor WhatsApp kamu<br>Klik Beli Sekarang & lakukan Pembayaran<br>Tunggu 1\n- 30 menit Produk akan masuk otomatis	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135756/mkstore/banner/15_asmlpt.png	0	t	f	2024-06-01 17:49:47	2025-10-24 18:50:33.567816	PV	\N
19	Google Play - Voucher	Voucher	Google Play	Google Play	f	https://res.cloudinary.com/dazayhg7s/image/upload/v1741012179/d28ac44e-a141-47ca-ae84-625c0172bef1_cj6qgj.jpg	<br>Beli Voucher\nGoogle Play Indonesia<br><br>1. Pilih Nominal<br>2. Pilih Pembayaran<br>3.\nTulis nomor WhatsApp yg benar!<br>Klik Order Now & lakukan\nPembayaran<br>4. Kode redeem Voucher otomatis	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135777/mkstore/banner/36_boyhb0.png	0	t	f	2023-11-27 19:32:13	2025-10-24 18:50:36.160085	GP	\N
130	Tom and Jerry: Chase	Games	Tom and Jerry Chase	NetEase	f				0	t	f	2025-10-24 15:43:59.998809	2025-10-26 17:51:24.190905	TJ	\N
128	The Ants: Underground Kingdom	Games	The Ants Underground Kingdom	StarUnion	f				0	t	f	2025-10-24 15:42:52.596601	2025-10-26 17:51:34.483658	TU	\N
72	Dynasty Heroes: Samkok Legend	Games	Dynasty Heroes Samkok Legend	Playbest Limited	f				0	t	f	2025-10-24 15:08:54.255086	2025-10-26 17:52:23.700198	DH	\N
70	Dragon Nest M: Classic	Games	Dragon Nest M Classic	7Road International	f				0	t	f	2025-10-24 15:07:12.895989	2025-10-26 17:52:28.764582	DC	\N
134	Arena Breakout - Voucher	Voucher	Arena Breakout	Level Infinite	f				0	t	f	2025-10-24 15:48:25.757667	2025-10-27 19:03:03.938958	ABV	\N
2	Genshin Impact	Games	Genshin Impact	HoYoverse	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1759136016/mkstore/thumbnail_v2/22_izilk2.png	Masukan User ID<br>Pilih Server<br>Pilih Nominal<br>Pilih\nPembayaran<br>Masukan Nomor WhatsApp kamu<br>Klik Beli Sekarang & lakukan\nPembayaran<br>Tunggu 1 menit Item akan masuk otomatis ke akun	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135753/mkstore/banner/2_i1t9as.png	0	t	f	2022-10-16 18:52:57	2025-10-23 19:40:13.394184	GI	CEKIDGICR
54	ASTRA: Knights of Veda	Games	ASTRA Knights of Veda	HYBE IM	f		Silakan masuk ke dalam game untuk memeriksa UID Anda. Anda dapat menemukan UID Anda dari tab [Akun] di Menu [Pengaturan]		0	t	f	2025-10-23 19:31:24.269595	2025-10-26 17:52:53.722631	AK	CEKIDAKRB
61	Goddess of Victory: Nikke	Games	Goddess of Victory Nikke	SHIFT UP Corporation	f		Untuk mengetahui User ID Anda, silakan klik menu profile dibagian kiri atas pada menu utama game. User ID akan terlihat dibagian bawah Nama Karakter Game Anda		0	t	f	2025-10-23 19:51:33.750952	2025-10-26 17:52:43.117547	GV	CEKIDGVGM
76	Harry Potter Magic Awakening	Games	Harry Potter Magic Awakening	NetEase	f				0	t	f	2025-10-24 15:16:23.95236	2025-10-24 15:16:23.95236	HP	CEKIDHPJW
55	AU2 Mobile	Games	AU2 MOBILE	AU Dance	f				0	t	f	2025-10-23 19:32:53.539361	2025-10-23 19:32:53.539361	AU	CEKIDAUDM
78	Heroic Uncle Kim	Games	Heroic Uncle Kim	GA Studio Inc.	f				0	t	f	2025-10-24 15:18:36.267713	2025-10-24 15:18:36.267713	HU	CEKIDHUGM
80	Identity V	Games	Identity V	NetEase	f				0	t	f	2025-10-24 15:20:04.304963	2025-10-24 15:20:04.304963	IV	CEKIDIVEC
79	Honkai Impact 3	Games	Honkai Impact 3	miHoYo	t				0	t	f	2025-10-24 15:19:02.38069	2025-11-04 05:30:35.969818	HI	CEKIDHICR
57	Captain Tsubasa: Ace	Games	Captain Tsubasa Ace	DeNA	f		1. Setelah masuk, ketuk \\"Pengguna\\" di sisi kanan layar\\n2. Ketika layar Pusat Pengguna muncul, Anda dapat melihat DeNA ID Anda		0	t	f	2025-10-23 19:46:43.875123	2025-10-26 17:52:51.323605	CT	\N
29	testcategoryahjjj	hjhhjf	knlklkn	jkjkjkjj	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1760591827/uploads/uploads/Screenshot%20from%202025-10-02%2014-28-48.png	jakaabajakaja	https://res.cloudinary.com/dikf91ikq/image/upload/v1760589594/uploads/uploads/Screenshot%20from%202025-09-28%2000-16-01.png	0	t	t	2025-10-16 12:17:38.159831	2025-10-16 12:18:58.298729	ljnjj	\N
82	Land of Empires	Games	Land of Empires	Nuverse	f				0	t	f	2025-10-24 15:20:46.510102	2025-10-24 15:20:46.510102	LE	\N
26	Roblox - Voucher	Voucher	Roblox	Roblox Corporation	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1759136140/mkstore/thumbnail_v2/34_wm1cao.png	Beli Voucher Roblox<br><br>1.\nPilih Nominal<br>2. Pilih Pembayaran<br>3. Tulis nomor WhatsApp yang\nbenar!<br>Klik Order Now & lakukan Pembayaran<br>4. Kode redeem Voucher\notomatis muncul di inv	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135763/mkstore/banner/18_cxzlcz.png	0	t	f	2024-06-25 06:38:52	2025-10-24 18:50:31.204933	RB	\N
5	Arena of Valor	Games	Arena of Valor	Tencent Garena	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135993/mkstore/thumbnail_v2/7_q2r7zf.png	Masukan User ID<br>Pilih Nominal<br>Pilih\nPembayaran<br>Masukan Nomor WhatsApp kamu<br>Klik Beli Sekarang & lakukan Pembayaran<br>Tunggu 1 menit Vouchers akan masuk otomatis ke akun Anda.	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135755/mkstore/banner/6_udxn8q.png	0	t	f	2023-07-17 17:10:12	2025-10-27 17:26:52.311764	AV	CEKIDAVVV
31	Ace Racer	Games	Ace Racer	NetEase	f		Untuk menemukan ID Pengguna Anda, login ke akun Anda di aplikasi. Klik tombol pengaturan dan Anda dapat menemukan ID Pengguna Anda di bawah gambar profil Anda.	https://res.cloudinary.com/dikf91ikq/image/upload/v1761222908/uploads/uploads/Ace%20Racer.png	0	t	t	2025-10-23 12:37:16.304208	2025-10-23 12:38:28.847067		\N
35	test	Games	moontonaja ajaa	test	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1761224388/uploads/uploads/test.png	test	https://res.cloudinary.com/dikf91ikq/image/upload/v1759399945/uploads/uploads/Plarium_%20Enter%20a%20World%20of%20Cross-Platform%20Gaming%21.jpeg.jpg	0	t	t	2025-10-23 13:00:06.532493	2025-10-23 13:00:12.803194	daataaaaaa	\N
4	PUBG Mobile	Games	PUBG Mobile	Tencent	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135990/mkstore/thumbnail_v2/3_bsnqwr.png	Open 24 JAM - Proses 1-30\nMenit<br><br><br>Note UC Indo : Hanya Khusus Untuk Akun PUBG\nIndonesia.<br><br>Mohon Perhatikan Negara Pada Akun Anda Sebelum\nMembeli.	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135990/mkstore/thumbnail_v2/3_bsnqwr.png	0	t	f	2023-07-16 17:08:38	2025-10-23 19:43:55.239577	PB	CEKIDPBUC
59	Crystal of Atlan	Games	Crystal of Atlan	Nuverse Games	f		Untuk mengetahui User ID Anda, silakan klik menu profile dibagian kiri atas pada menu utama game. User ID akan terlihat disebelah server Game Anda		0	t	f	2025-10-23 19:48:09.152477	2025-10-23 19:48:09.152477	CA	\N
60	Destiny M	Games	Destiny M	YUAN PLAY	f		Untuk mengetahui User ID Anda, silakan klik menu profile dibagian kiri atas pada menu utama game. User ID akan terlihat dibagian bawah Nama Karakter Game Anda		0	t	f	2025-10-23 19:48:53.813005	2025-10-23 19:48:53.813005	DM	\N
67	Hago	Games	Hago	Hago	f		Untuk menemukan User ID anda, ketuk pada gambar profile di kiri atas. ID dapat anda temukan tepat di bawah nickname		0	t	f	2025-10-23 19:53:07.024419	2025-10-23 19:53:07.024419	HG	\N
158	Valorant - PC	PC Topup	Valorant	Riot Games	f				0	t	f	2025-10-24 16:52:07.826127	2025-10-24 18:47:01.268672	VV	\N
156	VIU Premium - Voucher	Voucher	VIU Premium	PCCW VUCLIP	f				0	t	f	2025-10-24 16:49:11.513693	2025-10-24 18:48:50.086069	VU	\N
155	Vidio - Voucher	Voucher	Vidio	Surya Citra Media	f				0	t	f	2025-10-24 16:48:31.868281	2025-10-24 18:48:52.472702	VI	\N
154	TikTok Coin - Voucher	Voucher	TikTok Coin	TikTok Pte. Ltd	f				0	t	f	2025-10-24 16:48:06.386301	2025-10-24 18:48:54.817385	TC	\N
153	Steam - Voucher	Voucher	Steam	Valve	f				0	t	f	2025-10-24 16:47:43.461928	2025-10-24 18:48:57.654201	SV	\N
152	Razer Gold - Voucher	Voucher	Razer Gold	Razer Inc.	f				0	t	f	2025-10-24 16:47:10.832762	2025-10-24 18:49:13.455225	RG	\N
150	Play Station PSN - Voucher	Voucher	Play Station PSN	Sony	f				0	t	f	2025-10-24 16:46:12.598778	2025-10-24 18:49:22.688907	PS	\N
149	Nintendo Eshop - Voucher	Voucher	Nintendo Eshop	Nintendo	f				0	t	f	2025-10-24 16:20:34.441047	2025-10-24 18:49:29.372207	NN	\N
148	Netease Pay - Voucher	Voucher	Netease Pay	NetEase, Inc.	f				0	t	f	2025-10-24 16:19:59.317761	2025-10-24 18:49:33.640103	NP	\N
146	GeForce NOW - Voucher	Voucher	GeForce NOW	NVIDIA	f				0	t	f	2025-10-24 15:59:16.108081	2025-10-24 18:49:39.318934	GN	\N
147	IQIYI - Voucher	Voucher	IQIYI	iQIYI	f				0	t	f	2025-10-24 16:19:26.335293	2025-10-24 18:49:42.022245	IQ	\N
145	Discord - Voucher	Voucher	Discord	Discord Inc.	f				0	t	f	2025-10-24 15:58:04.863972	2025-10-24 18:50:05.216102	DC	\N
144	Crunchyroll - Voucher	Voucher	Crunchyroll	Electronic Card	f				0	t	f	2025-10-24 15:57:12.714651	2025-10-24 18:50:07.914804	CY	\N
142	Crossfire - Voucher	Voucher	Crossfire	Smilegate 	f				0	t	f	2025-10-24 15:56:32.620245	2025-10-24 18:50:10.986619	CF	\N
157	XBOX - Voucher	Voucher	XBOX	Microsoft	f				0	t	f	2025-10-24 16:49:35.153533	2025-10-26 10:44:08.136578	XB	\N
58	Command & Conquer™: Legions	Games	Command & Conquer	Westwood Studios	f		Untuk mengetahui User ID Anda, silakan klik menu profile dibagian kiri atas pada menu utama game. User ID akan terlihat dibagian bawah Nama Karakter Game Anda.		0	t	f	2025-10-23 19:47:33.360934	2025-10-26 17:52:47.849824	CC	\N
1	Mobile Legends Bang bang	Populer	MOBILE LEGENDS	Moonton	t	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135991/mkstore/thumbnail_v2/5_uge5lc.png	Masukan User ID & Server<br> Pilih Nominal<br> Pilih Pembayaran<br> Masukan Nomor WhatsApp kamu<br> Klik Beli Sekarang & lakukan Pembayaran<br> Tunggu 1 menit Diamond akan masuk otomatis ke akun Anda	https://res.cloudinary.com/dikf91ikq/image/upload/v1757907881/image_npvtkh.png	1	t	f	2025-09-13 08:46:45.814575	2025-11-16 13:28:57.028806	ML	CEKIDMLID
151	PUBG Mobile - Voucher	Voucher	PUBG Voucher	Tencent 	f				0	t	f	2025-10-24 16:46:44.721283	2025-10-24 18:49:57.973172	PG	CEKIDPBUC
3	Honkai: Star Rail	Games	Honkai Star Rail	HoYoverse	t	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135992/mkstore/thumbnail_v2/6_eqkyl1.png	Masukan User ID<br>Pilih Server<br>Pilih Nominal<br>Pilih\nPembayaran<br>Masukan Nomor WhatsApp kamu<br>Klik Beli Sekarang & lakukan\nPembayaran<br>Tunggu 1 menit Item akan masuk otomatis ke akun	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135751/mkstore/banner/4_xlpfwr.png	0	t	f	2023-09-01 05:25:08	2025-10-26 17:53:10.717481	HS	CEKIDHSOS
160	Arena Breakout	Games	AB Mobile	Level Infinite	f				0	t	f	2025-10-27 19:03:58.941406	2025-11-02 12:18:06.613414		CEKIDABBB
16	Eggy Party	Games	EGGY PARTY	NetEase Games	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1759136000/mkstore/thumbnail_v2/12_kdwfeh.png	Top up Eggy Party coins harga paling murah, aman, cepat, dan terpercaya <br>Cara topup Eggy Partyvia ID termurah cukup dengan\nmemasukkan ID dan lakukan pembayaran.	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135754/mkstore/banner/11_mmbpkh.png	0	t	f	2023-10-20 18:17:21	2025-10-23 19:37:10.771214	EP	CEKIDEPCO
30	jakajaka	ewallet	ajkajakaja	jjakaaja	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1760591446/uploads/uploads/Screenshot%20from%202025-09-11%2021-03-41.png	jkjkjnkjnkj	https://res.cloudinary.com/dikf91ikq/image/upload/v1760591980/uploads/uploads/Screenshot%20from%202025-09-04%2020-22-19.png	0	t	t	2025-10-16 12:25:29.59299	2025-10-16 12:27:20.670193	ajkaj	\N
53	Ace Racer	Games	ACE RACER	NetEase	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1761222908/uploads/uploads/Ace%20Racer.png			0	t	f	2025-10-23 13:51:18.829968	2025-10-24 13:32:12.984635	AC	
18	Garena Shell - Voucher	Voucher	Garena Shell	Garena	f	https://res.cloudinary.com/dazayhg7s/image/upload/v1741012047/1683959396229451683031556-90j346d0-garenashell1-1_nce7nw.webp	<br>Beli Voucher Garena Shell harga paling murah<br><br>1. Pilih\nNominal<br>2. Pilih Pembayaran<br>3. Tulis nomor WhatsApp yg\nbenar!<br>Klik Order Now & lakukan Pembayaran	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135756/mkstore/banner/13_qwwiek.png	0	t	f	2023-10-24 19:37:54	2025-10-24 18:48:35.658515	GS	\N
15	by.U	Pulsa	by.U	Telkomsel	f	https://res.cloudinary.com/dazayhg7s/image/upload/v1741011890/byu-logo_m5tp9t.webp	<br>Beli\npulsa reguler dan paket data by.U harga paling murah. Cara beli pulsa dan\ndata by.U termurah :<br><br>1. Masukkan No HP<br>2. Pilih Nominal<br>3.\nPilih Pembayaran<br>4. Bayar Sekarang	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135771/mkstore/banner/32_pkxdcd.png	0	t	f	2023-10-18 16:44:38	2024-06-03 15:47:28	\N	\N
14	XL	Pulsa	XL	PT XL Axiata\nTbk	f	https://res.cloudinary.com/dazayhg7s/image/upload/v1741011779/1683959504_zld3bj.webp	<br>Beli\npulsa reguler dan paket data XL harga paling murah. Cara beli pulsa dan\ndata XL termurah :<br><br>1. Masukkan No HP<br>2. Pilih Nominal<br>3.\nPilih Pembayaran<br>4. Bayar Sekarang	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135772/mkstore/banner/34_db5h7z.png	0	t	f	2023-10-18 16:38:41	2024-06-07 06:50:42	\N	\N
12	Axis	Pulsa	AXIS	PT XLSMART	f	https://res.cloudinary.com/dazayhg7s/image/upload/v1741011709/1691904496logo_ooveuo.webp	<br>Beli pulsa reguler dan paket data Axis harga paling murah. Cara beli\npulsa dan data Axis termurah :<br><br>1. Masukkan No HP<br>2. Pilih\nNominal<br>3. Pilih Pembayaran<br>4. Klik Bayar Sekarang	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135770/mkstore/banner/30_sk7zuf.png	0	t	f	2023-10-18 16:31:46	2025-11-01 21:55:52.586799	AX	\N
11	Indosat	Pulsa	INDOSAT	PT\nIndosat Tbk	f	https://res.cloudinary.com/dazayhg7s/image/upload/v1741011669/1683959552at__1_ogpwxc.webp	<br>Beli pulsa reguler dan paket data Indosat harga paling murah. Cara\nbeli pulsa dan data Indosat termurah :<br><br>1. Masukkan No HP<br>2.\nPilih Nominal<br>3. Pilih Pembayaran<br>4. Klik Bayar Sekarang	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135772/mkstore/banner/33_mixtt6.png	0	t	f	2023-10-18 16:26:50	2024-10-14 05:45:35	\N	\N
10	Telkomsel	Pulsa	TELKOMSEL	Telekomunikasi	f	https://res.cloudinary.com/dazayhg7s/image/upload/v1741011640/1683959564m_ez0jp3.webp	<br>Beli\npulsa reguler,paket data, dan masa aktif Telkomsel harga paling murah.\nCara beli pulsa dan data Telkomsel termurah :<br><br>1. Masukkan No\nHP<br>2. Pilih Nominal<br>3. Pilih Pembayaran	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135770/mkstore/banner/31_mujg0f.png	0	t	f	2023-10-18 16:21:22	2024-10-14 05:44:28	\N	\N
83	League of Legends : Wild Rift	Games	League of Legends Wild Rift	Riot Games	f				0	t	f	2025-10-24 15:21:37.502478	2025-10-26 17:52:21.138569	LL	\N
7	Call of Duty Mobile	Games	Call of Duty Mobile	Garena	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135996/mkstore/thumbnail_v2/9_nzguo0.png	Cara\nBeli :<br><br>Masukan User ID<br>Pilih Nominal<br>Pilih\nPembayaran<br>Masukan Nomor WhatsApp kamu<br>Klik Beli Sekarang & lakukan\nPembayaran<br>Tunggu 1 menit Diamond akan masuk otomatis	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135753/mkstore/banner/8_rmglwp.png	0	t	f	2023-09-01 05:50:24	2025-10-23 19:39:33.588773	CD	CEKIDCDID
8	FIFA MOBILE	Games	FC Mobile	EA Sports	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135997/mkstore/thumbnail_v2/10_h24y1y.png	Cara Beli :<br><br>Masukan User ID<br>Pilih Nominal<br>Pilih\nPembayaran<br>Masukan Nomor WhatsApp kamu<br>Klik Beli Sekarang & lakukan\nPembayaran<br>Tunggu 1 menit Diamond akan masuk otomatis	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135753/mkstore/banner/9_wxj44q.png	0	t	f	2023-09-01 07:09:26	2025-10-23 19:39:56.332261	FM	CEKIDFMFC
17	Free Fire	Populer	FREE FIRE	Garena	t	https://res.cloudinary.com/dikf91ikq/image/upload/v1759136023/mkstore/thumbnail_v2/25_yq2j86.png	Cara Beli\n:<br>Masukan User ID<br>Pilih Nominal<br>Pilih Pembayaran<br>Masukan Nomor\nWhatsApp kamu<br>Klik Beli Sekarang & lakukan Pembayaran<br>Tunggu 1 menit\nProduk akan masuk otomatis ke anda	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135755/mkstore/banner/12_a1r39t.png	0	t	f	2024-07-26 09:46:59	2025-10-24 03:26:31.756535	FF	CEKIDFF
86	Legends of Runeterra	Games	Legends of Runeterra	Riot Games	f				0	t	f	2025-10-24 15:22:46.934987	2025-10-24 15:22:46.934987	LR	CEKIDLRID
87	LifeAfter	Games	LifeAfter	NetEase	f				0	t	f	2025-10-24 15:23:08.085676	2025-10-24 15:23:08.085676	LA	CEKIDLACR
84	Legacy Fate: Sacred and Fearless	Games	Legacy Fate Sacred and Fearless	EYOU TECHNOLOGY	f				0	t	f	2025-10-24 15:22:02.922782	2025-10-26 17:52:18.093615	LF	CEKIDLFTO
85	Legend of Mushroom: Rush	Games	Legend of Mushroom Rush	SPARKGAME	f				0	t	f	2025-10-24 15:22:22.136186	2025-10-26 17:52:12.975403	LM	CEKIDLMDO
6	Undawn	Games	UNDAWN	Garena	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135994/mkstore/thumbnail_v2/8_vkg0ea.png	Cara Beli :<br><br>Masukan User ID<br>Pilih Nominal<br>Pilih\nPembayaran<br>Masukan Nomor WhatsApp kamu<br>Klik Beli Sekarang & lakukan\nPembayaran<br>Tunggu 1 menit Diamond akan masuk otomatis	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135753/mkstore/banner/7_dod1rl.png	0	t	f	2023-09-01 05:44:00	2025-10-23 19:45:04.597546	UD	\N
13	Three	Pulsa	THREE	PT\nIndosat Tbk	f	https://res.cloudinary.com/dazayhg7s/image/upload/v1741011748/1683959515_zwy7hx.webp	<br>Beli\npulsa reguler dan paket data Three harga paling murah. Cara beli pulsa dan\ndata Three termurah :<br><br>1. Masukkan No HP<br>2. Pilih Nominal<br>3.\nPilih Pembayaran<br>4. Bayar Sekarang	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135772/mkstore/banner/35_j0o7i1.png	0	t	f	2023-10-18 16:34:45	2025-10-24 03:31:52.907509		\N
89	Lineage2M	Games	Lineage2M	NCV GAMES	f				0	t	f	2025-10-24 15:24:36.039141	2025-10-24 15:24:36.039141	L2	\N
90	Lords Mobile	Games	Lords Mobile	IGG	f				0	t	f	2025-10-24 15:25:03.105508	2025-10-24 15:25:03.105508	LM	\N
91	Lovebrush Chronicles	Games	Lovebrush Chronicles	Exptional Global	f				0	t	f	2025-10-24 15:25:28.748899	2025-10-24 15:25:28.748899	LB	\N
92	Machina Waking	Games	Machina Waking	EYOUGAME	f				0	t	f	2025-10-24 15:26:00.28228	2025-10-24 15:26:00.28228	MW	\N
94	MARVEL Duel	Games	MARVEL Duel	NetEase	f				0	t	f	2025-10-24 15:26:44.555448	2025-10-24 15:26:44.555448	MD	\N
95	MARVEL SNAP	Games	MARVEL SNAP	Nuverse	f				0	t	f	2025-10-24 15:27:03.569857	2025-10-24 15:27:03.569857	MS	\N
96	MOB RUSH	Games	MOB RUSH	Vizta Games	f				0	t	f	2025-10-24 15:27:31.180238	2025-10-24 15:27:31.180238	MB	\N
97	MU New Dawn	Games	MU New Dawn	PlayPark	f				0	t	f	2025-10-24 15:28:11.903329	2025-10-24 15:28:11.903329	MD	\N
25	Stumble Guys	Games	Stumble Guys	Kitka Games	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1759136014/mkstore/thumbnail_v2/21_qzpzlc.png	Masukan Username<br>Pilih\nNominal<br>Pilih Pembayaran<br>Masukan Nomor WhatsApp kamu<br>Klik Beli\nSekarang & lakukan Pembayaran<br>Tunggu 1 menit DM akan masuk otomatis ke\nakun Anda.	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135761/mkstore/banner/19_irblz0.png	0	f	f	2024-06-12 15:30:39	2025-10-23 19:44:55.597403		\N
98	MU Origin 2	Games	MU Origin 2	Gamenow Technology	f				0	t	f	2025-10-24 15:30:25.808107	2025-10-24 15:30:25.808107	M2	\N
99	MU Origin 3	Games	MU Origin 3	FingerFun	f				0	t	f	2025-10-24 15:30:45.018803	2025-10-24 15:30:45.018803	M3	\N
101	NBA INFINITE	Games	NBA INFINITE	Level Infinite	f				0	t	f	2025-10-24 15:31:29.533618	2025-10-24 15:31:29.533619	NI	\N
104	Once Human	Games	Once Human	NetEase 	f				0	t	f	2025-10-24 15:33:11.642408	2025-10-24 15:33:11.642408	OH	\N
106	Onmyoji Arena	Games	Onmyoji Arena	NetEase 	f				0	t	f	2025-10-24 15:34:06.109161	2025-10-24 15:34:06.109161	OA	\N
107	Path to Nowhere	Games	Path to Nowhere	AISNO 	f				0	t	f	2025-10-24 15:34:20.541975	2025-10-24 15:34:20.541975	PN	\N
108	Pixel Gun 3D	Games	Pixel Gun 3D	Cubic Games	f				0	t	f	2025-10-24 15:34:37.062996	2025-10-24 15:34:37.062996	PG	\N
102	PUBG New State Mobile	Games	PUBG New State Mobile	PUBG Corporation	f				0	t	f	2025-10-24 15:32:31.186845	2025-10-24 15:32:31.186845	NS	CEKIDPBUC
9	Metal Slug Awakening	Games	METAL SLUG AWAKENING	VNGGAMES	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135999/mkstore/thumbnail_v2/11_xntfzz.png	Cara Beli :<br>Masukan User ID<br>Pilih Nominal<br>Pilih\nPembayaran<br>Masukan Nomor WhatsApp kamu<br>Klik Beli Sekarang & lakukan\nPembayaran<br>Tunggu 1 menit Produk akan masuk otomatis ke a	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135754/mkstore/banner/10_dzqmzk.png	0	t	f	2023-09-16 19:30:05	2025-11-03 02:58:28.481547	MA	CEKIDMAID
24	Love and Deepspace	Games	Love and Deepspace	InFold Pte. Ltd.	t	https://res.cloudinary.com/dikf91ikq/image/upload/v1759136016/mkstore/thumbnail_v2/22_izilk2.png	Masukan User ID<br>Pilih\nNominal<br>Pilih Pembayaran<br>Masukan Nomor WhatsApp kamu<br>Klik Beli\nSekarang & lakukan Pembayaran<br>Tunggu 1 menit DM akan masuk otomatis ke\nakun Anda.	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135756/mkstore/banner/17_nps8xw.png	0	t	f	2024-06-12 15:18:30	2025-11-03 20:15:03.274113	LD	CEKIDLDCR
109	Pokémon Unite	Games	Pokémon Unite	The Pokémon Company	f				0	t	f	2025-10-24 15:34:54.671422	2025-10-24 15:34:54.671422	PU	\N
111	Racing Master	Games	Racing Master	Exptional Global	f				0	t	f	2025-10-24 15:35:28.155497	2025-10-24 15:35:28.155497	RM	\N
114	Ragnarok Origin	Games	Ragnarok Origin	Gravity Interactive	f				0	t	f	2025-10-24 15:37:40.23462	2025-10-24 15:37:40.23462	RO	\N
116	Revelation Infinite Journey	Games	Revelation Infinite Journey	VNG Corporation	f				0	t	f	2025-10-24 15:38:14.321727	2025-10-24 15:38:14.321727	RI	\N
118	SEAL M SEA	Games	SEAL M SEA	PLAYWITH GAMES	f				0	t	f	2025-10-24 15:39:25.600038	2025-10-24 15:39:25.600039	SE	\N
122	Speed Drifters	Games	Speed Drifters	Garena	f				0	t	f	2025-10-24 15:40:29.910122	2025-10-24 15:40:29.910122	SD	\N
123	State of Survival Zombie War	Games	State of Survival Zombie War	FunPlus	f				0	t	f	2025-10-24 15:40:55.439872	2025-10-24 15:40:55.439872	SS	\N
124	Super SUS	Games	Super SUS	PI Productions	f				0	t	f	2025-10-24 15:41:20.663303	2025-10-24 15:41:20.663303	SU	\N
125	Tamashi: Rise of Yokai	Games	Tamashi Rise of Yokai	EYOUGAME	f				0	t	f	2025-10-24 15:41:36.242256	2025-10-26 17:51:37.823946	TR	\N
121	Soul Land: New World	Games	Soul Land New World	LING CHAI	f				0	t	f	2025-10-24 15:40:10.980104	2025-10-26 17:51:40.057925	SL	\N
119	Snowbreak: Containment Zone	Games	Snowbreak Containment Zone	Seasun Games	f				0	t	f	2025-10-24 15:39:43.022195	2025-10-26 17:51:42.537659	SC	\N
115	Ragnarok X: Next Generation	Games	Ragnarok X Next Generation	PIPO (HK) Limited	f				0	t	f	2025-10-24 15:37:56.405439	2025-10-26 17:51:44.756187	RN	\N
113	Ragnarok M: Eternal Love	Games	Ragnarok M Eternal Love	Gravity Interactive	f				0	t	f	2025-10-24 15:36:09.936422	2025-10-26 17:51:49.857476	RE	\N
112	Ragnarok M: Classic	Games	Ragnarok M Classic	Gravity Interactive	f				0	t	f	2025-10-24 15:35:49.657666	2025-10-26 17:51:56.679867	RC	\N
110	Punishing: Gray Raven	Games	Punishing Gray Raven	KURO TECHNOLOGY	f				0	t	f	2025-10-24 15:35:11.909982	2025-10-26 17:51:58.624912	PG	\N
105	ONE PUNCH MAN: The Strongest	Games	ONE PUNCH MAN The Strongest	FingerFun	f				0	t	f	2025-10-24 15:33:30.530892	2025-10-26 17:52:00.545717	OP	\N
103	OCTOPATH Traveler: CotC	Games	OCTOPATH Traveler CotC	SQUARE ENIX	f				0	t	f	2025-10-24 15:32:53.226883	2025-10-26 17:52:02.908226	OC	\N
100	MU: Devils Awaken	Games	MU Devils Awaken	FingerFun 	f				0	t	f	2025-10-24 15:31:10.102979	2025-10-26 17:52:05.559217	MA	\N
88	Light of Thel : New Era	Games	Light of Thel New Era	Ling Ren Game	f				0	t	f	2025-10-24 15:24:10.595358	2025-10-26 17:52:10.664908	LT	\N
21	Honor of Kings	Populer	Honor Of Kings	Tencent Games	f	https://res.cloudinary.com/dikf91ikq/image/upload/v1761546049/workspaces/honorofkings_omiafk_1_uyszvm.jpg	Cara\nBeli :<br>Masukan User ID<br>Pilih Nominal<br>Pilih Pembayaran<br>Masukan\nNomor WhatsApp kamu<br>Klik Beli Sekarang & lakukan Pembayaran<br>Tunggu 1\n- 30 menit Produk akan masuk otomatis	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135755/mkstore/banner/14_megdi8.png	0	t	f	2024-05-31 14:07:26	2025-10-23 19:42:12.191822	HK	
117	Sausage Man	Games	Sausage Man	X.D. Network	f				0	t	f	2025-10-24 15:39:06.642847	2025-10-24 15:39:06.642848	SM	CEKIDSMCN
93	Magic Chess: Go Go	Games	Magic Chess Go Go	Vizta Games	f				0	t	f	2025-10-24 15:26:23.413263	2025-10-26 17:52:07.73259	MC	CEKIDMCID
27	Zenless Zone Zero	Populer	Zenless Zone Zero	miHoYo	t	https://res.cloudinary.com/dikf91ikq/image/upload/v1759136001/mkstore/thumbnail_v2/13_phb799.png	Masukan User ID<br>Pilih Server<br>Pilih\nNominal<br>Pilih Pembayaran<br>Masukan Nomor WhatsApp kamu<br>Klik Beli\nSekarang & lakukan Pembayaran<br>Tunggu 1 menit Item akan masuk otomatis\nke akun anda	https://res.cloudinary.com/dikf91ikq/image/upload/v1759135756/mkstore/banner/17_nps8xw.png	0	t	f	2024-07-18 06:22:16	2025-11-12 13:41:28.177113	ZZ	CEKIDZZIK
\.


--
-- Data for Name: environment_variables; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.environment_variables (code, redis_config, no_admin, duitku_key, duitku_merchant, fonte_key) FROM stdin;
developement	localhost:6969	6282226197047	5013e832c29e45c50ef5b740f6fc8097	D20336	ubg42AjmdPxz7LMjKHhN
production	redis:6969	6282226197047	5013e832c29e45c50ef5b740f6fc8097	D20336	ubg42AjmdPxz7LMjKHhN
\.


--
-- Data for Name: fees; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.fees (id, reference_name, fee_amount, fee_percentage, calculation_type, is_active, created_at, updated_at, method_code, kode_payment) FROM stdin;
384	I1	3000.00	0.80	hybrid	t	2025-10-22 09:05:03.394839	2025-10-22 09:05:03.394839	\N	I1
385	BR	2500.00	0.70	hybrid	t	2025-10-22 09:05:03.394839	2025-10-22 09:05:03.394839	\N	BR
386	B1	2000.00	0.60	hybrid	t	2025-10-22 09:05:03.394839	2025-10-22 09:05:03.394839	\N	B1
389	FT	3000.00	0.80	hybrid	t	2025-10-22 09:05:03.394839	2025-10-22 09:05:03.394839	\N	FT
391	DA	2000.00	0.70	hybrid	t	2025-10-22 09:05:03.394839	2025-10-22 09:05:03.394839	\N	DA
394	VA	3000.00	1.00	hybrid	t	2025-10-22 09:05:03.394839	2025-10-22 09:05:03.394839	\N	VA
395	method:I1:PAKETSUP3	3200.00	0.90	hybrid	t	2025-10-22 09:07:13.977517	2025-10-22 09:07:13.977517	\N	PAKETSUP3
396	method:BR:PAKETSUP3	2700.00	0.80	hybrid	t	2025-10-22 09:07:13.977517	2025-10-22 09:07:13.977517	\N	PAKETSUP3
397	method:B1:PAKETSUP3	2200.00	0.70	hybrid	t	2025-10-22 09:07:13.977517	2025-10-22 09:07:13.977517	\N	PAKETSUP3
398	method:BT:PAKETSUP3	3700.00	1.10	hybrid	t	2025-10-22 09:07:13.977517	2025-10-22 09:07:13.977517	\N	PAKETSUP3
400	method:FT:PAKETSUP3	3200.00	0.90	hybrid	t	2025-10-22 09:07:13.977517	2025-10-22 09:07:13.977517	\N	PAKETSUP3
401	method:M2:PAKETSUP3	2700.00	1.10	hybrid	t	2025-10-22 09:07:13.977517	2025-10-22 09:07:13.977517	\N	PAKETSUP3
402	method:DA:PAKETSUP3	2200.00	0.80	hybrid	t	2025-10-22 09:07:13.977517	2025-10-22 09:07:13.977517	\N	PAKETSUP3
403	method:OV:PAKETSUP3	1700.00	0.60	hybrid	t	2025-10-22 09:07:13.977517	2025-10-22 09:07:13.977517	\N	PAKETSUP3
404	method:SA:PAKETSUP3	2700.00	0.90	hybrid	t	2025-10-22 09:07:13.977517	2025-10-22 09:07:13.977517	\N	PAKETSUP3
405	method:VA:PAKETSUP3	3200.00	1.10	hybrid	t	2025-10-22 09:07:13.977517	2025-10-22 09:07:13.977517	\N	PAKETSUP3
406	method:I1:PAKETSUP6	3200.00	0.90	hybrid	t	2025-10-22 09:07:51.269599	2025-10-22 09:07:51.269599	\N	PAKETSUP6
407	method:BR:PAKETSUP6	2700.00	0.80	hybrid	t	2025-10-22 09:07:51.269599	2025-10-22 09:07:51.269599	\N	PAKETSUP6
408	method:B1:PAKETSUP6	2200.00	0.70	hybrid	t	2025-10-22 09:07:51.269599	2025-10-22 09:07:51.269599	\N	PAKETSUP6
409	method:BT:PAKETSUP6	3700.00	1.10	hybrid	t	2025-10-22 09:07:51.269599	2025-10-22 09:07:51.269599	\N	PAKETSUP6
411	method:FT:PAKETSUP6	3200.00	0.90	hybrid	t	2025-10-22 09:07:51.269599	2025-10-22 09:07:51.269599	\N	PAKETSUP6
412	method:M2:PAKETSUP6	2700.00	1.10	hybrid	t	2025-10-22 09:07:51.269599	2025-10-22 09:07:51.269599	\N	PAKETSUP6
413	method:DA:PAKETSUP6	2200.00	0.80	hybrid	t	2025-10-22 09:07:51.269599	2025-10-22 09:07:51.269599	\N	PAKETSUP6
414	method:OV:PAKETSUP6	1700.00	0.60	hybrid	t	2025-10-22 09:07:51.269599	2025-10-22 09:07:51.269599	\N	PAKETSUP6
415	method:SA:PAKETSUP6	2700.00	0.90	hybrid	t	2025-10-22 09:07:51.269599	2025-10-22 09:07:51.269599	\N	PAKETSUP6
416	method:VA:PAKETSUP6	3200.00	1.10	hybrid	t	2025-10-22 09:07:51.269599	2025-10-22 09:07:51.269599	\N	PAKETSUP6
417	method:I1:PAKETSUP12	3200.00	0.90	hybrid	t	2025-10-22 09:07:57.353693	2025-10-22 09:07:57.353693	\N	PAKETSUP12
418	method:BR:PAKETSUP12	2700.00	0.80	hybrid	t	2025-10-22 09:07:57.353693	2025-10-22 09:07:57.353693	\N	PAKETSUP12
419	method:B1:PAKETSUP12	2200.00	0.70	hybrid	t	2025-10-22 09:07:57.353693	2025-10-22 09:07:57.353693	\N	PAKETSUP12
420	method:BT:PAKETSUP12	3700.00	1.10	hybrid	t	2025-10-22 09:07:57.353693	2025-10-22 09:07:57.353693	\N	PAKETSUP12
422	method:FT:PAKETSUP12	3200.00	0.90	hybrid	t	2025-10-22 09:07:57.353693	2025-10-22 09:07:57.353693	\N	PAKETSUP12
423	method:M2:PAKETSUP12	2700.00	1.10	hybrid	t	2025-10-22 09:07:57.353693	2025-10-22 09:07:57.353693	\N	PAKETSUP12
424	method:DA:PAKETSUP12	2200.00	0.80	hybrid	t	2025-10-22 09:07:57.353693	2025-10-22 09:07:57.353693	\N	PAKETSUP12
425	method:OV:PAKETSUP12	1700.00	0.60	hybrid	t	2025-10-22 09:07:57.353693	2025-10-22 09:07:57.353693	\N	PAKETSUP12
426	method:SA:PAKETSUP12	2700.00	0.90	hybrid	t	2025-10-22 09:07:57.353693	2025-10-22 09:07:57.353693	\N	PAKETSUP12
427	method:VA:PAKETSUP12	3200.00	1.10	hybrid	t	2025-10-22 09:07:57.353693	2025-10-22 09:07:57.353693	\N	PAKETSUP12
428	method:I1:PAKETLEG3	3200.00	0.90	hybrid	t	2025-10-22 09:08:48.019206	2025-10-22 09:08:48.019206	\N	PAKETLEG3
429	method:BR:PAKETLEG3	2700.00	0.80	hybrid	t	2025-10-22 09:08:48.019206	2025-10-22 09:08:48.019206	\N	PAKETLEG3
430	method:B1:PAKETLEG3	2200.00	0.70	hybrid	t	2025-10-22 09:08:48.019206	2025-10-22 09:08:48.019206	\N	PAKETLEG3
431	method:BT:PAKETLEG3	3700.00	1.10	hybrid	t	2025-10-22 09:08:48.019206	2025-10-22 09:08:48.019206	\N	PAKETLEG3
432	method:SQ:PAKETLEG3	4200.00	1.00	hybrid	t	2025-10-22 09:08:48.019206	2025-10-22 09:08:48.019206	\N	PAKETLEG3
433	method:FT:PAKETLEG3	3200.00	0.90	hybrid	t	2025-10-22 09:08:48.019206	2025-10-22 09:08:48.019206	\N	PAKETLEG3
434	method:M2:PAKETLEG3	2700.00	1.10	hybrid	t	2025-10-22 09:08:48.019206	2025-10-22 09:08:48.019206	\N	PAKETLEG3
435	method:DA:PAKETLEG3	2200.00	0.80	hybrid	t	2025-10-22 09:08:48.019206	2025-10-22 09:08:48.019206	\N	PAKETLEG3
436	method:OV:PAKETLEG3	1700.00	0.60	hybrid	t	2025-10-22 09:08:48.019206	2025-10-22 09:08:48.019206	\N	PAKETLEG3
437	method:SA:PAKETLEG3	2700.00	0.90	hybrid	t	2025-10-22 09:08:48.019206	2025-10-22 09:08:48.019206	\N	PAKETLEG3
438	method:VA:PAKETLEG3	3200.00	1.10	hybrid	t	2025-10-22 09:08:48.019206	2025-10-22 09:08:48.019206	\N	PAKETLEG3
439	method:I1:PAKETLEG6	3200.00	0.90	hybrid	t	2025-10-22 09:08:52.204756	2025-10-22 09:08:52.204756	\N	PAKETLEG6
440	method:BR:PAKETLEG6	2700.00	0.80	hybrid	t	2025-10-22 09:08:52.204756	2025-10-22 09:08:52.204756	\N	PAKETLEG6
441	method:B1:PAKETLEG6	2200.00	0.70	hybrid	t	2025-10-22 09:08:52.204756	2025-10-22 09:08:52.204756	\N	PAKETLEG6
442	method:BT:PAKETLEG6	3700.00	1.10	hybrid	t	2025-10-22 09:08:52.204756	2025-10-22 09:08:52.204756	\N	PAKETLEG6
443	method:SQ:PAKETLEG6	4200.00	1.00	hybrid	t	2025-10-22 09:08:52.204756	2025-10-22 09:08:52.204756	\N	PAKETLEG6
444	method:FT:PAKETLEG6	3200.00	0.90	hybrid	t	2025-10-22 09:08:52.204756	2025-10-22 09:08:52.204756	\N	PAKETLEG6
445	method:M2:PAKETLEG6	2700.00	1.10	hybrid	t	2025-10-22 09:08:52.204756	2025-10-22 09:08:52.204756	\N	PAKETLEG6
446	method:DA:PAKETLEG6	2200.00	0.80	hybrid	t	2025-10-22 09:08:52.204756	2025-10-22 09:08:52.204756	\N	PAKETLEG6
447	method:OV:PAKETLEG6	1700.00	0.60	hybrid	t	2025-10-22 09:08:52.204756	2025-10-22 09:08:52.204756	\N	PAKETLEG6
448	method:SA:PAKETLEG6	2700.00	0.90	hybrid	t	2025-10-22 09:08:52.204756	2025-10-22 09:08:52.204756	\N	PAKETLEG6
449	method:VA:PAKETLEG6	3200.00	1.10	hybrid	t	2025-10-22 09:08:52.204756	2025-10-22 09:08:52.204756	\N	PAKETLEG6
450	method:I1:PAKETLEG12	3200.00	0.90	hybrid	t	2025-10-22 09:08:55.156015	2025-10-22 09:08:55.156015	\N	PAKETLEG12
451	method:BR:PAKETLEG12	2700.00	0.80	hybrid	t	2025-10-22 09:08:55.156015	2025-10-22 09:08:55.156015	\N	PAKETLEG12
452	method:B1:PAKETLEG12	2200.00	0.70	hybrid	t	2025-10-22 09:08:55.156015	2025-10-22 09:08:55.156015	\N	PAKETLEG12
453	method:BT:PAKETLEG12	3700.00	1.10	hybrid	t	2025-10-22 09:08:55.156015	2025-10-22 09:08:55.156015	\N	PAKETLEG12
454	method:SQ:PAKETLEG12	4200.00	1.00	hybrid	t	2025-10-22 09:08:55.156015	2025-10-22 09:08:55.156015	\N	PAKETLEG12
455	method:FT:PAKETLEG12	3200.00	0.90	hybrid	t	2025-10-22 09:08:55.156015	2025-10-22 09:08:55.156015	\N	PAKETLEG12
421	method:SQ:PAKETSUP12	4200.00	1.00	hybrid	t	2025-10-22 09:07:57.353693	2025-10-22 09:07:57.353693	\N	PAKETSUP12
399	method:SQ:PAKETSUP3	4200.00	1.00	hybrid	t	2025-10-22 09:07:13.977517	2025-10-22 09:07:13.977517	\N	PAKETSUP3
387	BT	3600.00	0.00	hybrid	t	2025-10-22 09:05:03.394839	2025-10-22 09:05:03.394839	\N	BT
390	M2	2500.00	1.20	hybrid	t	2025-10-22 09:05:03.394839	2025-10-22 09:05:03.394839	\N	M2
392	OV	1500.00	1.12	hybrid	t	2025-10-22 09:05:03.394839	2025-10-22 09:05:03.394839	\N	OV
393	SA	2500.00	1.70	percentage	t	2025-10-22 09:05:03.394839	2025-10-22 09:05:03.394839	\N	SA
388	SQ	4000.00	0.90	percentage	t	2025-10-22 09:05:03.394839	2025-10-22 09:05:03.394839	\N	SQ
456	method:M2:PAKETLEG12	2700.00	1.10	hybrid	t	2025-10-22 09:08:55.156015	2025-10-22 09:08:55.156015	\N	PAKETLEG12
457	method:DA:PAKETLEG12	2200.00	0.80	hybrid	t	2025-10-22 09:08:55.156015	2025-10-22 09:08:55.156015	\N	PAKETLEG12
458	method:OV:PAKETLEG12	1700.00	0.60	hybrid	t	2025-10-22 09:08:55.156015	2025-10-22 09:08:55.156015	\N	PAKETLEG12
459	method:SA:PAKETLEG12	2700.00	0.90	hybrid	t	2025-10-22 09:08:55.156015	2025-10-22 09:08:55.156015	\N	PAKETLEG12
460	method:VA:PAKETLEG12	3200.00	1.10	hybrid	t	2025-10-22 09:08:55.156015	2025-10-22 09:08:55.156015	\N	PAKETLEG12
461	method:I1:PAKETBAS3	3200.00	0.90	hybrid	t	2025-10-22 09:09:08.916537	2025-10-22 09:09:08.916537	\N	PAKETBAS3
463	method:B1:PAKETBAS3	2200.00	0.70	hybrid	t	2025-10-22 09:09:08.916537	2025-10-22 09:09:08.916537	\N	PAKETBAS3
464	method:BT:PAKETBAS3	3700.00	1.10	hybrid	t	2025-10-22 09:09:08.916537	2025-10-22 09:09:08.916537	\N	PAKETBAS3
465	method:SQ:PAKETBAS3	4200.00	1.00	hybrid	t	2025-10-22 09:09:08.916537	2025-10-22 09:09:08.916537	\N	PAKETBAS3
466	method:FT:PAKETBAS3	3200.00	0.90	hybrid	t	2025-10-22 09:09:08.916537	2025-10-22 09:09:08.916537	\N	PAKETBAS3
467	method:M2:PAKETBAS3	2700.00	1.10	hybrid	t	2025-10-22 09:09:08.916537	2025-10-22 09:09:08.916537	\N	PAKETBAS3
468	method:DA:PAKETBAS3	2200.00	0.80	hybrid	t	2025-10-22 09:09:08.916537	2025-10-22 09:09:08.916537	\N	PAKETBAS3
469	method:OV:PAKETBAS3	1700.00	0.60	hybrid	t	2025-10-22 09:09:08.916537	2025-10-22 09:09:08.916537	\N	PAKETBAS3
470	method:SA:PAKETBAS3	2700.00	0.90	hybrid	t	2025-10-22 09:09:08.916537	2025-10-22 09:09:08.916537	\N	PAKETBAS3
471	method:VA:PAKETBAS3	3200.00	1.10	hybrid	t	2025-10-22 09:09:08.916537	2025-10-22 09:09:08.916537	\N	PAKETBAS3
472	method:I1:PAKETBAS6	3200.00	0.90	hybrid	t	2025-10-22 09:09:11.901838	2025-10-22 09:09:11.901838	\N	PAKETBAS6
473	method:BR:PAKETBAS6	2700.00	0.80	hybrid	t	2025-10-22 09:09:11.901838	2025-10-22 09:09:11.901838	\N	PAKETBAS6
474	method:B1:PAKETBAS6	2200.00	0.70	hybrid	t	2025-10-22 09:09:11.901838	2025-10-22 09:09:11.901838	\N	PAKETBAS6
475	method:BT:PAKETBAS6	3700.00	1.10	hybrid	t	2025-10-22 09:09:11.901838	2025-10-22 09:09:11.901838	\N	PAKETBAS6
476	method:SQ:PAKETBAS6	4200.00	1.00	hybrid	t	2025-10-22 09:09:11.901838	2025-10-22 09:09:11.901838	\N	PAKETBAS6
477	method:FT:PAKETBAS6	3200.00	0.90	hybrid	t	2025-10-22 09:09:11.901838	2025-10-22 09:09:11.901838	\N	PAKETBAS6
478	method:M2:PAKETBAS6	2700.00	1.10	hybrid	t	2025-10-22 09:09:11.901838	2025-10-22 09:09:11.901838	\N	PAKETBAS6
479	method:DA:PAKETBAS6	2200.00	0.80	hybrid	t	2025-10-22 09:09:11.901838	2025-10-22 09:09:11.901838	\N	PAKETBAS6
480	method:OV:PAKETBAS6	1700.00	0.60	hybrid	t	2025-10-22 09:09:11.901838	2025-10-22 09:09:11.901838	\N	PAKETBAS6
481	method:SA:PAKETBAS6	2700.00	0.90	hybrid	t	2025-10-22 09:09:11.901838	2025-10-22 09:09:11.901838	\N	PAKETBAS6
482	method:VA:PAKETBAS6	3200.00	1.10	hybrid	t	2025-10-22 09:09:11.901838	2025-10-22 09:09:11.901838	\N	PAKETBAS6
483	method:I1:PAKETBAS12	3200.00	0.90	hybrid	t	2025-10-22 09:09:14.514019	2025-10-22 09:09:14.514019	\N	PAKETBAS12
484	method:BR:PAKETBAS12	2700.00	0.80	hybrid	t	2025-10-22 09:09:14.514019	2025-10-22 09:09:14.514019	\N	PAKETBAS12
485	method:B1:PAKETBAS12	2200.00	0.70	hybrid	t	2025-10-22 09:09:14.514019	2025-10-22 09:09:14.514019	\N	PAKETBAS12
486	method:BT:PAKETBAS12	3700.00	1.10	hybrid	t	2025-10-22 09:09:14.514019	2025-10-22 09:09:14.514019	\N	PAKETBAS12
487	method:SQ:PAKETBAS12	4200.00	1.00	hybrid	t	2025-10-22 09:09:14.514019	2025-10-22 09:09:14.514019	\N	PAKETBAS12
488	method:FT:PAKETBAS12	3200.00	0.90	hybrid	t	2025-10-22 09:09:14.514019	2025-10-22 09:09:14.514019	\N	PAKETBAS12
489	method:M2:PAKETBAS12	2700.00	1.10	hybrid	t	2025-10-22 09:09:14.514019	2025-10-22 09:09:14.514019	\N	PAKETBAS12
490	method:DA:PAKETBAS12	2200.00	0.80	hybrid	t	2025-10-22 09:09:14.514019	2025-10-22 09:09:14.514019	\N	PAKETBAS12
491	method:OV:PAKETBAS12	1700.00	0.60	hybrid	t	2025-10-22 09:09:14.514019	2025-10-22 09:09:14.514019	\N	PAKETBAS12
492	method:SA:PAKETBAS12	2700.00	0.90	hybrid	t	2025-10-22 09:09:14.514019	2025-10-22 09:09:14.514019	\N	PAKETBAS12
493	method:VA:PAKETBAS12	3200.00	1.10	hybrid	t	2025-10-22 09:09:14.514019	2025-10-22 09:09:14.514019	\N	PAKETBAS12
494	method:I1:PAKETPRO3	3200.00	0.90	hybrid	t	2025-10-22 09:09:20.627943	2025-10-22 09:09:20.627943	\N	PAKETPRO3
495	method:BR:PAKETPRO3	2700.00	0.80	hybrid	t	2025-10-22 09:09:20.627943	2025-10-22 09:09:20.627943	\N	PAKETPRO3
496	method:B1:PAKETPRO3	2200.00	0.70	hybrid	t	2025-10-22 09:09:20.627943	2025-10-22 09:09:20.627943	\N	PAKETPRO3
497	method:BT:PAKETPRO3	3700.00	1.10	hybrid	t	2025-10-22 09:09:20.627943	2025-10-22 09:09:20.627943	\N	PAKETPRO3
498	method:SQ:PAKETPRO3	4200.00	1.00	hybrid	t	2025-10-22 09:09:20.627943	2025-10-22 09:09:20.627943	\N	PAKETPRO3
499	method:FT:PAKETPRO3	3200.00	0.90	hybrid	t	2025-10-22 09:09:20.627943	2025-10-22 09:09:20.627943	\N	PAKETPRO3
500	method:M2:PAKETPRO3	2700.00	1.10	hybrid	t	2025-10-22 09:09:20.627943	2025-10-22 09:09:20.627943	\N	PAKETPRO3
501	method:DA:PAKETPRO3	2200.00	0.80	hybrid	t	2025-10-22 09:09:20.627943	2025-10-22 09:09:20.627943	\N	PAKETPRO3
502	method:OV:PAKETPRO3	1700.00	0.60	hybrid	t	2025-10-22 09:09:20.627943	2025-10-22 09:09:20.627943	\N	PAKETPRO3
503	method:SA:PAKETPRO3	2700.00	0.90	hybrid	t	2025-10-22 09:09:20.627943	2025-10-22 09:09:20.627943	\N	PAKETPRO3
504	method:VA:PAKETPRO3	3200.00	1.10	hybrid	t	2025-10-22 09:09:20.627943	2025-10-22 09:09:20.627943	\N	PAKETPRO3
505	method:I1:PAKETPRO6	3200.00	0.90	hybrid	t	2025-10-22 09:09:23.721356	2025-10-22 09:09:23.721356	\N	PAKETPRO6
506	method:BR:PAKETPRO6	2700.00	0.80	hybrid	t	2025-10-22 09:09:23.721356	2025-10-22 09:09:23.721356	\N	PAKETPRO6
507	method:B1:PAKETPRO6	2200.00	0.70	hybrid	t	2025-10-22 09:09:23.721356	2025-10-22 09:09:23.721356	\N	PAKETPRO6
508	method:BT:PAKETPRO6	3700.00	1.10	hybrid	t	2025-10-22 09:09:23.721356	2025-10-22 09:09:23.721356	\N	PAKETPRO6
509	method:SQ:PAKETPRO6	4200.00	1.00	hybrid	t	2025-10-22 09:09:23.721356	2025-10-22 09:09:23.721356	\N	PAKETPRO6
510	method:FT:PAKETPRO6	3200.00	0.90	hybrid	t	2025-10-22 09:09:23.721356	2025-10-22 09:09:23.721356	\N	PAKETPRO6
511	method:M2:PAKETPRO6	2700.00	1.10	hybrid	t	2025-10-22 09:09:23.721356	2025-10-22 09:09:23.721356	\N	PAKETPRO6
512	method:DA:PAKETPRO6	2200.00	0.80	hybrid	t	2025-10-22 09:09:23.721356	2025-10-22 09:09:23.721356	\N	PAKETPRO6
513	method:OV:PAKETPRO6	1700.00	0.60	hybrid	t	2025-10-22 09:09:23.721356	2025-10-22 09:09:23.721356	\N	PAKETPRO6
514	method:SA:PAKETPRO6	2700.00	0.90	hybrid	t	2025-10-22 09:09:23.721356	2025-10-22 09:09:23.721356	\N	PAKETPRO6
515	method:VA:PAKETPRO6	3200.00	1.10	hybrid	t	2025-10-22 09:09:23.721356	2025-10-22 09:09:23.721356	\N	PAKETPRO6
516	method:I1:PAKETPRO12	3200.00	0.90	hybrid	t	2025-10-22 09:09:25.595995	2025-10-22 09:09:25.595995	\N	PAKETPRO12
517	method:BR:PAKETPRO12	2700.00	0.80	hybrid	t	2025-10-22 09:09:25.595995	2025-10-22 09:09:25.595995	\N	PAKETPRO12
518	method:B1:PAKETPRO12	2200.00	0.70	hybrid	t	2025-10-22 09:09:25.595995	2025-10-22 09:09:25.595995	\N	PAKETPRO12
519	method:BT:PAKETPRO12	3700.00	1.10	hybrid	t	2025-10-22 09:09:25.595995	2025-10-22 09:09:25.595995	\N	PAKETPRO12
520	method:SQ:PAKETPRO12	4200.00	1.00	hybrid	t	2025-10-22 09:09:25.595995	2025-10-22 09:09:25.595995	\N	PAKETPRO12
521	method:FT:PAKETPRO12	3200.00	0.90	hybrid	t	2025-10-22 09:09:25.595995	2025-10-22 09:09:25.595995	\N	PAKETPRO12
522	method:M2:PAKETPRO12	2700.00	1.10	hybrid	t	2025-10-22 09:09:25.595995	2025-10-22 09:09:25.595995	\N	PAKETPRO12
523	method:DA:PAKETPRO12	2200.00	0.80	hybrid	t	2025-10-22 09:09:25.595995	2025-10-22 09:09:25.595995	\N	PAKETPRO12
524	method:OV:PAKETPRO12	1700.00	0.60	hybrid	t	2025-10-22 09:09:25.595995	2025-10-22 09:09:25.595995	\N	PAKETPRO12
525	method:SA:PAKETPRO12	2700.00	0.90	hybrid	t	2025-10-22 09:09:25.595995	2025-10-22 09:09:25.595995	\N	PAKETPRO12
526	method:VA:PAKETPRO12	3200.00	1.10	hybrid	t	2025-10-22 09:09:25.595995	2025-10-22 09:09:25.595995	\N	PAKETPRO12
410	method:SQ:PAKETSUP6	4200.00	1.00	hybrid	t	2025-10-22 09:07:51.269599	2025-10-22 09:07:51.269599	\N	PAKETSUP6
527	PAKETSUP3	3200.00	0.90	hybrid	t	2025-10-22 14:18:40.435325	2025-10-22 14:18:40.435325	\N	PAKETSUP3
528	PAKETLEG3	3200.00	0.90	hybrid	t	2025-10-22 14:18:40.435325	2025-10-22 14:18:40.435325	\N	PAKETLEG3
529	PAKETLEG6	3200.00	0.90	hybrid	t	2025-10-22 14:18:40.435325	2025-10-22 14:18:40.435325	\N	PAKETLEG6
530	PAKETPRO12	3200.00	0.90	hybrid	t	2025-10-22 14:18:40.435325	2025-10-22 14:18:40.435325	\N	PAKETPRO12
531	PAKETPRO3	3200.00	0.90	hybrid	t	2025-10-22 14:18:40.435325	2025-10-22 14:18:40.435325	\N	PAKETPRO3
532	PAKETBAS6	3200.00	0.90	hybrid	t	2025-10-22 14:18:40.435325	2025-10-22 14:18:40.435325	\N	PAKETBAS6
533	PAKETLEG12	3200.00	0.90	hybrid	t	2025-10-22 14:18:40.435325	2025-10-22 14:18:40.435325	\N	PAKETLEG12
534	PAKETBAS12	3200.00	0.90	hybrid	t	2025-10-22 14:18:40.435325	2025-10-22 14:18:40.435325	\N	PAKETBAS12
535	PAKETPRO6	3200.00	0.90	hybrid	t	2025-10-22 14:18:40.435325	2025-10-22 14:18:40.435325	\N	PAKETPRO6
536	PAKETSUP6	3200.00	0.90	hybrid	t	2025-10-22 14:18:40.435325	2025-10-22 14:18:40.435325	\N	PAKETSUP6
537	PAKETSUP12	3200.00	0.90	hybrid	t	2025-10-22 14:18:40.435325	2025-10-22 14:18:40.435325	\N	PAKETSUP12
462	method:BR:PAKETBAS3	2700.00	1.00	hybrid	t	2025-10-22 09:09:08.916537	2025-10-22 14:28:06.696188	\N	PAKETBAS3
538	PAKETBAS3	3200.00	12.00	hybrid	t	2025-10-22 14:18:40.435325	2025-10-22 15:15:46.231477	\N	PAKETBAS3
\.


--
-- Data for Name: flash_sale; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.flash_sale (id, title, description, start_at, end_at, is_active, created_at, updated_at, branch_id) FROM stdin;
16	aaaa	aaaaa	2025-10-29 06:40:00+00	2025-10-31 06:40:00+00	t	2025-10-29 06:44:04.561694+00	2025-10-29 06:44:04.561694+00	5
17	TEST	AAAAAA	2025-10-30 07:51:00+00	2025-11-01 07:51:00+00	t	2025-10-30 07:51:30.531854+00	2025-10-30 07:51:30.531854+00	5
\.


--
-- Data for Name: flash_sale_products; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.flash_sale_products (id, flash_sale_id, product_id, stock_reserved, stock_sold, created_at, original_price, flash_sale_price, thumbnail) FROM stdin;
20	17	1430	10000	2	2025-10-30 08:10:51.132524+00	310343	100000.00	https://res.cloudinary.com/dikf91ikq/image/upload/v1761731080/uploads/uploads/honorofkings_omiafk%5B1%5D.webp
\.


--
-- Data for Name: form_fields; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.form_fields (id, category_brand, field_name, field_type, field_label, is_required, field_order, options, created_at) FROM stdin;
100	Magic Chess Go Go	gameId	number	User ID	f	0	\N	2025-11-12 13:17:55.114965
13	GOOGLE PLAY	gameId	text	Masukkan Nomor Handphone	f	0	\N	2025-10-01 06:55:00.67014
36	Genshin Impact	gameId	number	UserID	f	0	\N	2025-11-03 19:53:30.938162
48	Captain Tsubasa Ace	gameId	number	DENA ID	f	0	\N	2025-11-03 20:30:38.216949
2	MOBILE LEGENDS	gameId	number	Masukkan User Id	t	1	\N	2025-09-13 08:49:10.994698
4	MOBILE LEGENDS	serverId	number	Masukkan Server Id	t	2	\N	2025-09-13 08:49:56.131576
28	Arena of Valor	gameId	number	Masukkan User Id	f	0	[]	2025-10-01 07:04:03.768005
26	Call of Duty MOBILE	gameId	number	Masukkan User Id	f	0	[]	2025-10-01 07:01:34.862757
15	FREE FIRE	gameId	number	Masukkan User Id	f	0	[]	2025-10-01 06:55:47.807505
50	Command & Conquer	gameId	number	User ID	f	0	\N	2025-11-03 20:32:18.412152
27	UNDAWN	gameId	number	Masukkan User Id	f	0	[]	2025-10-01 07:02:09.943757
37	Genshin Impact	serverId	select	Zone ID	f	0	[{"value":"os_usa","label":"America"},{"value":"os_euro","label":"Europe"},{"value":"os_asia","label":"Asia"},{"value":"os_cht","label":"TW, HK, MO"}]	2025-11-03 19:54:19.74513
38	ACE RACER	gameId	number	User ID	f	0	\N	2025-11-03 19:56:52.256618
40	AFK JOURNEY	gameId	number	User ID	f	0	\N	2025-11-03 20:00:17.35671
39	ACE RACER	serverId	select	Zone ID	f	1	[{"value":"10001","label":"JAPAN"},{"value":"10011","label":"KOREA"},{"value":"10021","label":"ASIA"},{"value":"10031","label":"NORTH-AMERICA"},{"value":"10041","label":"EUROPE"}]	2025-11-03 19:59:24.84551
51	Command & Conquer	serverId	select	Server	f	1	[{"value":"Battlefield-1","label":"Battlefield-1"},{"value":"Battlefield-2","label":"Battlefield-2"},{"value":"Battlefield-3","label":"Battlefield-3"},{"value":"Battlefield-4","label":"Battlefield-4"},{"value":"Battlefield-5","label":"Battlefield-5"},{"value":"Battlefield-6","label":"Battlefield-6"},{"value":"Battlefield-7","label":"Battlefield-7"},{"value":"Battlefield-8","label":"Battlefield-8"},{"value":"Battlefield-9","label":"Battlefield-9"},{"value":"Battlefield-10","label":"Battlefield-10"},{"value":"Battlefield-11","label":"Battlefield-11"}]	2025-11-03 20:33:59.849713
101	Magic Chess Go Go	serverId	number	Server ID	f	1	\N	2025-11-12 13:17:55.114965
52	Crystal of Atlan	gameId	number	User ID	f	0	\N	2025-11-03 20:34:50.479574
43	ASTRA Knights of Veda	gameId	number	User ID	f	0	\N	2025-11-03 20:10:21.536532
44	ASTRA Knights of Veda	serverId	select	Zone ID	f	1	[{"value":"10040100","label":"KR / JP / TW"},{"value":"10040200","label":"SEA / OCE"},{"value":"10040400","label":"AMERICAS"},{"value":"10040300","label":"EUROPE"}]	2025-11-03 20:11:02.304386
45	AU2 Mobile	gameId	text	User ID	f	0	\N	2025-11-03 20:11:32.287172
16	EGGY PARTY	gameId	number	Masukkan User ID	f	0	[]	2025-10-01 06:56:21.169375
25	FC Mobile	gameId	number	Masukkan User Id	f	0	[]	2025-10-01 07:00:39.195909
11	Honor Of Kings	gameId	number	Masukkan User Id	f	0	[]	2025-10-01 06:54:10.455852
30	Honkai Star Rail	gameId	number	Masukkan User Id	f	0	[]	2025-10-01 07:05:12.717985
8	Love and Deepspace	gameId	number	Masukkan Hunter ID	f	0	[]	2025-10-01 06:52:15.705502
24	METAL SLUG AWAKENING	gameId	number	Masukkan User Id	f	0	[]	2025-10-01 07:00:04.901825
29	PUBG Mobile	gameId	number	Masukkan User Id	f	0	[]	2025-10-01 07:04:18.481394
46	Blood Strike	gameId	number	User ID	f	0	\N	2025-11-03 20:28:57.905114
47	Cabal Infinite Combo	gameId	text	User ID	f	0	\N	2025-11-03 20:29:31.281874
53	Destiny M	gameId	number	User ID	f	0	\N	2025-11-03 20:35:26.722498
54	Dragon Nest M Classic	gameId	number	User ID	f	0	\N	2025-11-03 20:35:59.375705
55	Dragon Nest M Classic	serverId	number	Zone ID	f	1	\N	2025-11-03 20:36:19.683777
56	Dunk City Dynasty	gameId	text	User ID	f	0	\N	2025-11-03 20:36:48.355726
57	Dunk City Dynasty	serverId	select	Server	f	1	[{"value":"4001","label":"Moore Park"},{"value":"4002","label":"Rucker Park"},{"value":"4003","label":"Tenement Court"},{"value":"4004","label":"Hooper Park"}]	2025-11-03 20:37:41.474722
58	Goddess of Victory Nikke	gameId	number	User ID	f	0	\N	2025-11-03 20:38:53.37679
59	Goddess of Victory Nikke	serverId	select	Server	f	1	[{"value":"SEA","label":"SEA"},{"value":"Global","label":"Global"},{"value":"NA","label":"NA"},{"value":"JP","label":"JP"},{"value":"KR","label":"KR"}]	2025-11-03 20:39:34.328889
60	GROWTOPIA	gameId	text	Grow ID	f	0	\N	2025-11-03 20:40:02.113942
61	Hago	gameId	number	User ID	f	0	\N	2025-11-03 20:40:54.915852
62	HAIKYU FLY HIGH	gameId	text	User ID	f	0	\N	2025-11-03 20:41:20.32021
63	Harry Potter Magic Awakening	gameId	number	User ID	f	0	\N	2025-11-03 20:41:45.764034
64	Harry Potter Magic Awakening	serverId	select	Server	f	1	[{"value":"12001","label":"萬應室"},{"value":"13011","label":"不死鳥"},{"value":"13012","label":"ユニコーン\\\\"},{"value":"13013","label":"니플러"},{"value":"13014","label":"Ashwinder"},{"value":"13015","label":"Erumpent"},{"value":"13016","label":"Sphinx"},{"value":"13017","label":"Rougarou"},{"value":"13018","label":"\\"驺吾(海外加速区）"},{"value":"22001","label":"Kelpie"}]	2025-11-03 20:43:35.196231
65	Heaven Burns Red	gameId	text	User ID	f	0	\N	2025-11-03 20:43:57.248884
66	Heroic Uncle Kim	gameId	text	User ID	f	0	\N	2025-11-03 20:44:20.813405
67	Honkai Impact 3	gameId	number	User ID	f	0	\N	2025-11-03 20:44:42.985796
68	Identity V	gameId	number	User ID	f	0	\N	2025-11-03 20:45:21.831396
69	Identity V	serverId	select	Server	f	1	[{"value":"Asia","label":"Asia"},{"value":"NA/EU","label":"NA and EU"}]	2025-11-03 20:45:53.068077
70	Kings Choice	gameId	text	User ID	f	0	\N	2025-11-03 20:46:38.431757
71	Land of Empires	gameId	number	User ID	f	0	\N	2025-11-03 20:47:07.75181
72	League of Legends Wild Rift	gameId	number	User ID	f	0	\N	2025-11-03 20:47:30.349306
73	Legends of Runeterra	gameId	text	Riot id	f	0	\N	2025-11-03 20:48:51.008797
74	Light of Thel New Era	gameId	text	User ID	f	0	\N	2025-11-03 20:50:01.401504
102	ONE PUNCH MAN The Strongest	gameId	text	User ID	f	0	\N	2025-11-12 13:17:55.114965
103	ONE PUNCH MAN The Strongest	serverId	number	Server ID	f	1	\N	2025-11-12 13:17:55.114965
104	Once Human	gameId	text	User ID	f	0	\N	2025-11-12 13:17:55.114965
105	Once Human	serverId	select	Server Region	f	1	[{"value":"Europe","label":"Europe"},{"value":"HK/Macao/Taiwan","label":"HK/Macao/Taiwan"},{"value":"Japan Server","label":"Japan Server"},{"value":"Korea Server","label":"Korea Server"},{"value":"North America","label":"North America"},{"value":"South America","label":"South America"},{"value":"Southeast Asia Server","label":"Southeast Asia Server"}]	2025-11-12 13:17:55.114965
106	Once Human	additional_information	text	Server	f	2	\N	2025-11-12 13:17:55.114965
107	Pokémon Unite	gameId	number	Support ID	f	0	\N	2025-11-12 13:17:55.114965
108	Punishing Gray Raven	gameId	text	Role ID	f	0	\N	2025-11-12 13:17:55.114965
35	Honkai Star Rail	serverId	select	Server	f	1	[{"value":"prod_official_asia","label":"Asia"},{"value":"prod_official_usa","label":"America"},{"value":"prod_official_eur","label":"Europe"},{"value":"prod_official_cht","label":"TW,HK,MO"}]	2025-10-23 15:17:40.647245
75	HAIKYU FLY HIGH	gameId	number	Masukkan Game Id	f	0	\N	2025-11-12 02:35:21.155797
76	AFK JOURNEY	gameId	number	Masukkan Game Id	f	0	\N	2025-11-12 02:35:41.465465
78	Blood Strike	gameId	number	Masukkan Game Id	f	0	\N	2025-11-12 02:36:07.202526
79	Dunk City Dynasty	gameId	number	Masukkan Game Id	f	0	\N	2025-11-12 02:36:18.513441
80	GROWTOPIA	gameId	number	Masukkan Game Id	f	0	\N	2025-11-12 02:37:06.216313
81	Cabal Infinite Combo	gameId	number	Masukkan Game Id	f	0	\N	2025-11-12 02:41:08.426504
82	FOOTBALL RISING STAR	gameId	number	Masukkan Game Id	f	0	\N	2025-11-12 02:41:28.015505
83	Age of Empires Mobile	gameId	number	User ID	f	0	\N	2025-11-12 13:12:22.407745
84	Age of Empires Mobile	serverId	select	Server	f	1	[{"value":"5000","label":"Realm002"},{"value":"5001","label":"Realm001"},{"value":"5002","label":"Kingdom001"},{"value":"5003","label":"Kingdom002"},{"value":"5004","label":"Kingdom003"},{"value":"5005","label":"Kingdom004"},{"value":"5006","label":"Kingdom005"},{"value":"5007","label":"Kingdom006"},{"value":"5008","label":"Kingdom007"},{"value":"5009","label":"Kingdom008"},{"value":"5010","label":"Kingdom009"},{"value":"5011","label":"Kingdom010"},{"value":"5012","label":"Empire #001"},{"value":"5013","label":"Empire #002"},{"value":"5014","label":"Empire #003"},{"value":"5015","label":"Empire #004"},{"value":"5016","label":"Empire #005"},{"value":"5017","label":"Empire #006"},{"value":"5018","label":"Empire #007"},{"value":"5019","label":"Empire #008"},{"value":"5020","label":"Empire #009"},{"value":"5021","label":"Empire #010"},{"value":"5022","label":"Empire #011"},{"value":"5023","label":"Empire #012"},{"value":"5024","label":"Empire #013"},{"value":"5025","label":"Empire #014"},{"value":"5026","label":"Empire #015"},{"value":"5027","label":"Empire #016"},{"value":"5028","label":"Empire #017"},{"value":"5029","label":"Empire #018"},{"value":"5030","label":"Empire #019"},{"value":"5031","label":"Empire #020"},{"value":"5032","label":"Empire #021"},{"value":"5033","label":"Empire #022"},{"value":"5034","label":"Empire #023"},{"value":"5035","label":"Empire #024"},{"value":"5036","label":"Empire #025"},{"value":"5037","label":"Empire #026"},{"value":"5038","label":"Empire #027"},{"value":"5039","label":"Empire #028"},{"value":"5040","label":"Empire #029"},{"value":"5041","label":"Empire #030"},{"value":"5042","label":"Empire #031"},{"value":"5043","label":"Empire #032"},{"value":"5044","label":"Empire #033"},{"value":"5045","label":"Empire #034"},{"value":"5046","label":"Empire #035"},{"value":"5047","label":"Empire #036"},{"value":"5048","label":"Empire #037"},{"value":"5049","label":"Empire #038"},{"value":"5050","label":"Empire #039"},{"value":"5051","label":"Empire #040"},{"value":"5052","label":"Empire #041"},{"value":"5053","label":"Empire #042"},{"value":"5054","label":"Empire #043"},{"value":"5055","label":"Empire #044"},{"value":"5056","label":"Empire #045"},{"value":"5057","label":"Empire #046"},{"value":"5058","label":"Empire #047"},{"value":"5059","label":"Empire #048"},{"value":"5060","label":"Empire #049"},{"value":"5061","label":"Empire #050"},{"value":"5062","label":"Empire #051"},{"value":"5063","label":"Empire #052"},{"value":"5064","label":"Empire #053"},{"value":"5065","label":"Empire #054"},{"value":"5066","label":"Empire #055"},{"value":"5067","label":"Empire #056"},{"value":"5068","label":"Empire #057"},{"value":"5069","label":"Empire #058"},{"value":"5070","label":"Empire #059"},{"value":"5071","label":"Empire #060"},{"value":"5072","label":"Empire #061"},{"value":"5073","label":"Empire #062"},{"value":"5074","label":"Empire #063"},{"value":"5075","label":"Empire #064"},{"value":"5076","label":"Empire #065"},{"value":"5077","label":"Empire #066"},{"value":"5078","label":"Empire #067"},{"value":"5079","label":"Empire #068"},{"value":"5080","label":"Empire #069"},{"value":"5081","label":"Empire #070"},{"value":"5082","label":"Empire #071"},{"value":"5083","label":"Empire #072"},{"value":"5084","label":"Empire #073"},{"value":"5085","label":"Empire #074"},{"value":"5086","label":"Empire #075"},{"value":"5087","label":"Empire #076"},{"value":"5088","label":"Empire #077"},{"value":"5089","label":"Empire #078"},{"value":"5090","label":"Empire #079"},{"value":"5091","label":"Empire #080"},{"value":"5092","label":"Empire #081"},{"value":"5093","label":"Empire #082"},{"value":"5094","label":"Empire #083"},{"value":"5095","label":"Empire #084"},{"value":"5096","label":"Empire #085"},{"value":"5097","label":"Empire #086"},{"value":"5098","label":"Empire #087"},{"value":"5099","label":"Empire #088"},{"value":"5100","label":"Empire #089"},{"value":"5101","label":"Empire #090"},{"value":"5102","label":"Empire #091"},{"value":"5103","label":"Empire #092"},{"value":"5104","label":"Empire #093"},{"value":"5105","label":"Empire #094"},{"value":"5106","label":"Empire #095"},{"value":"5107","label":"Empire #096"},{"value":"5108","label":"Empire #097"},{"value":"5109","label":"Empire #098"},{"value":"5110","label":"Empire #099"},{"value":"5111","label":"Empire #100"},{"value":"5112","label":"Empire #101"},{"value":"5113","label":"Empire #102"},{"value":"5114","label":"Empire #103"},{"value":"5115","label":"Empire #104"},{"value":"5116","label":"Empire #105"},{"value":"5117","label":"Empire #106"},{"value":"5118","label":"Empire #107"},{"value":"5119","label":"Empire #108"},{"value":"5120","label":"Empire #109"},{"value":"5121","label":"Empire #110"},{"value":"5122","label":"Empire #111"},{"value":"5123","label":"Empire #112"},{"value":"5124","label":"Empire #113"},{"value":"5125","label":"Empire #114"},{"value":"5126","label":"Empire #115"},{"value":"5127","label":"Empire #116"},{"value":"5128","label":"Empire #117"},{"value":"5129","label":"Empire #118"},{"value":"5130","label":"Empire #119"},{"value":"5131","label":"Empire #120"},{"value":"5132","label":"Empire #121"},{"value":"5133","label":"Empire #122"},{"value":"5134","label":"Empire #123"},{"value":"5135","label":"Empire #124"},{"value":"5136","label":"Empire #125"},{"value":"5137","label":"Empire #126"},{"value":"5138","label":"Empire #127"},{"value":"5139","label":"Empire #128"},{"value":"5140","label":"Empire #129"},{"value":"5141","label":"Empire #130"},{"value":"5142","label":"Empire #131"},{"value":"5143","label":"Empire #132"},{"value":"5144","label":"Empire #133"},{"value":"5145","label":"Empire #134"},{"value":"5146","label":"Empire #135"},{"value":"5147","label":"Empire #136"},{"value":"5148","label":"Empire #137"},{"value":"5149","label":"Empire #138"},{"value":"5150","label":"Empire #139"},{"value":"5151","label":"Empire #140"},{"value":"5152","label":"Empire #141"},{"value":"5153","label":"Empire #142"},{"value":"5154","label":"Empire #143"},{"value":"5155","label":"Empire #144"},{"value":"5156","label":"Empire #145"},{"value":"5157","label":"Empire #146"},{"value":"5158","label":"Empire #147"},{"value":"5159","label":"Empire #148"},{"value":"5160","label":"Empire #149"},{"value":"5161","label":"Empire #150"},{"value":"5162","label":"Empire #151"},{"value":"5163","label":"Empire #152"},{"value":"5164","label":"Empire #153"},{"value":"5165","label":"Empire #154"},{"value":"5166","label":"Empire #155"},{"value":"5167","label":"Empire #156"},{"value":"5168","label":"Empire #157"},{"value":"5169","label":"Empire #158"},{"value":"5170","label":"Empire #159"},{"value":"5171","label":"Empire #160"},{"value":"5172","label":"Empire #161"},{"value":"5173","label":"Empire #162"},{"value":"5174","label":"Empire #163"},{"value":"5175","label":"Empire #164"},{"value":"5176","label":"Empire #165"},{"value":"5177","label":"Empire #166"},{"value":"5178","label":"Empire #167"},{"value":"5179","label":"Empire #168"},{"value":"5180","label":"Empire #169"},{"value":"5181","label":"Empire #170"},{"value":"5182","label":"Empire #171"},{"value":"5183","label":"Empire #172"},{"value":"5184","label":"Empire #173"},{"value":"5185","label":"Empire #174"},{"value":"5186","label":"Empire #175"},{"value":"5187","label":"Empire #176"},{"value":"5188","label":"Empire #177"},{"value":"5189","label":"Empire #178"},{"value":"5190","label":"Empire #179"},{"value":"5191","label":"Empire #180"},{"value":"5192","label":"Empire #181"},{"value":"5193","label":"Empire #182"},{"value":"5194","label":"Empire #183"},{"value":"5195","label":"Empire #184"},{"value":"5196","label":"Empire #185"},{"value":"5197","label":"Empire #186"},{"value":"5198","label":"Empire #187"},{"value":"5199","label":"Empire #188"},{"value":"5200","label":"Empire #189"},{"value":"5201","label":"Empire #190"},{"value":"5202","label":"Empire #191"},{"value":"5203","label":"Empire #192"},{"value":"5204","label":"Empire #193"},{"value":"5205","label":"Empire #194"},{"value":"5206","label":"Empire #195"},{"value":"5207","label":"Empire #196"},{"value":"5208","label":"Empire #197"},{"value":"5209","label":"Empire #198"},{"value":"5210","label":"Empire #199"},{"value":"5211","label":"Empire #200"}]	2025-11-12 13:17:55.114965
85	Arena Breakout	gameId	number	Open ID	f	0	\N	2025-11-12 13:17:55.114965
86	Arena of Valor	gameId	number	User ID	f	0	\N	2025-11-12 13:17:55.114965
87	Lineage2M	gameId	text	User ID	f	0	\N	2025-11-12 13:17:55.114965
88	Lineage2M	serverId	select	Server	f	1	[{"value":"14001","label":"Bartz01"},{"value":"14002","label":"Bartz02"},{"value":"14003","label":"Bartz03"},{"value":"14004","label":"Bartz04"},{"value":"14005","label":"Bartz05"},{"value":"14006","label":"Bartz06"},{"value":"14007","label":"Bartz07"},{"value":"14008","label":"Bartz08"},{"value":"14009","label":"Bartz09"},{"value":"14010","label":"Bartz10"},{"value":"14011","label":"Kain01"},{"value":"14012","label":"Kain02"},{"value":"14013","label":"Kain03"},{"value":"14014","label":"Kain04"},{"value":"14015","label":"Kain05"},{"value":"14016","label":"Kain06"},{"value":"14017","label":"Kain07"},{"value":"14018","label":"Kain08"},{"value":"14019","label":"Kain09"},{"value":"14020","label":"Kain10"},{"value":"14021","label":"Teon01"},{"value":"14022","label":"Teon02"},{"value":"14023","label":"Teon03"},{"value":"14024","label":"Teon04"},{"value":"14025","label":"Teon05"},{"value":"14026","label":"Teon06"},{"value":"14027","label":"Teon07"},{"value":"14028","label":"Teon08"},{"value":"14029","label":"Teon09"},{"value":"14030","label":"Teon10"}]	2025-11-12 13:17:55.114965
89	Lords Mobile	gameId	number	User ID	f	0	\N	2025-11-12 13:17:55.114965
90	MARVEL SNAP	gameId	text	User ID	f	0	\N	2025-11-12 13:17:55.114965
91	MU New Dawn	gameId	text	User ID	f	0	\N	2025-11-12 13:17:55.114965
92	MU New Dawn	serverId	text	Character	f	1	\N	2025-11-12 13:17:55.114965
93	MU Origin 2	gameId	number	User ID	f	0	\N	2025-11-12 13:17:55.114965
94	MU Origin 2	serverId	number	Server	f	1	\N	2025-11-12 13:17:55.114965
95	MU Origin 3	gameId	text	Role ID	f	0	\N	2025-11-12 13:17:55.114965
96	MU Devils Awaken	gameId	text	User ID	f	0	\N	2025-11-12 13:17:55.114965
97	MU Devils Awaken	serverId	text	Server	f	1	\N	2025-11-12 13:17:55.114965
98	Machina Waking	gameId	text	User ID	f	0	\N	2025-11-12 13:17:55.114965
99	Machina Waking	serverId	select	Server ID	f	1	[{"value":"10","label":"S8-MW Prime"},{"value":"100","label":"S98-MW Prime"},{"value":"101","label":"S99-MW Prime"},{"value":"102","label":"S100-MW Prime"},{"value":"103","label":"S101-MW Prime"},{"value":"104","label":"S102-MW Prime"},{"value":"105","label":"S103-MW Prime"},{"value":"106","label":"S104-MW Prime"},{"value":"107","label":"S105-MW Prime"},{"value":"108","label":"S106-MW Prime"},{"value":"109","label":"S107-MW Prime"},{"value":"11","label":"S9-MW Prime"},{"value":"110","label":"S108-MW Prime"},{"value":"111","label":"S109-MW Prime"},{"value":"112","label":"S110-MW Prime"},{"value":"113","label":"S111-MW Prime"},{"value":"114","label":"S112-MW Prime"},{"value":"115","label":"S113-MW Prime"},{"value":"116","label":"S114-MW Prime"},{"value":"117","label":"S115-MW Prime"},{"value":"118","label":"S116-MW Prime"},{"value":"119","label":"S117-MW Prime"},{"value":"12","label":"S10-MW Prime"},{"value":"120","label":"S118-MW Prime"},{"value":"121","label":"S119-MW Prime"},{"value":"122","label":"S120-MW Prime"},{"value":"123","label":"S121-MW Prime"},{"value":"13","label":"S11-MW Prime"},{"value":"14","label":"S12-MW Prime"},{"value":"15","label":"S13-MW Prime"},{"value":"16","label":"S14-MW Prime"},{"value":"17","label":"S15-MW Prime"},{"value":"18","label":"S16-MW Prime"},{"value":"19","label":"S17-MW Prime"},{"value":"20","label":"S18-MW Prime"},{"value":"21","label":"S19-MW Prime"},{"value":"22","label":"S20-MW Prime"},{"value":"23","label":"S21-MW Prime"},{"value":"24","label":"S22-MW Prime"},{"value":"25","label":"S23-MW Prime"},{"value":"26","label":"S24-MW Prime"},{"value":"27","label":"S25-MW Prime"},{"value":"28","label":"S26-MW Prime"},{"value":"29","label":"S27-MW Prime"},{"value":"3","label":"S1-MW Prime"},{"value":"30","label":"S28-MW Prime"},{"value":"31","label":"S29-MW Prime"},{"value":"32","label":"S30-MW Prime"},{"value":"33","label":"S31-MW Prime"},{"value":"34","label":"S32-MW Prime"},{"value":"35","label":"S33-MW Prime"},{"value":"36","label":"S34-MW Prime"},{"value":"37","label":"S35-MW Prime"},{"value":"38","label":"S36-MW Prime"},{"value":"39","label":"S37-MW Prime"},{"value":"4","label":"S2-MW Prime"},{"value":"40","label":"S38-MW Prime"},{"value":"41","label":"S39-MW Prime"},{"value":"42","label":"S40-MW Prime"},{"value":"43","label":"S41-MW Prime"},{"value":"44","label":"S42-MW Prime"},{"value":"45","label":"S43-MW Prime"},{"value":"46","label":"S44-MW Prime"},{"value":"47","label":"S45-MW Prime"},{"value":"48","label":"S46-MW Prime"},{"value":"49","label":"S47-MW Prime"},{"value":"5","label":"S3-MW Prime"},{"value":"50","label":"S48-MW Prime"},{"value":"51","label":"S49-MW Prime"},{"value":"52","label":"S50-MW Prime"},{"value":"53","label":"S51-MW Prime"},{"value":"54","label":"S52-MW Prime"},{"value":"55","label":"S53-MW Prime"},{"value":"56","label":"S54-MW Prime"},{"value":"57","label":"S55-MW Prime"},{"value":"58","label":"S56-MW Prime"},{"value":"59","label":"S57-MW Prime"},{"value":"6","label":"S4-MW Prime"},{"value":"60","label":"S58-MW Prime"},{"value":"61","label":"S59-MW Prime"},{"value":"62","label":"S60-MW Prime"},{"value":"63","label":"S61-MW Prime"},{"value":"64","label":"S62-MW Prime"},{"value":"65","label":"S63-MW Prime"},{"value":"66","label":"S64-MW Prime"},{"value":"67","label":"S65-MW Prime"},{"value":"68","label":"S66-MW Prime"},{"value":"69","label":"S67-MW Prime"},{"value":"7","label":"S5-MW Prime"},{"value":"70","label":"S68-MW Prime"},{"value":"71","label":"S69-MW Prime"},{"value":"72","label":"S70-MW Prime"},{"value":"73","label":"S71-MW Prime"},{"value":"74","label":"S72-MW Prime"},{"value":"75","label":"S73-MW Prime"},{"value":"76","label":"S74-MW Prime"},{"value":"77","label":"S75-MW Prime"},{"value":"78","label":"S76-MW Prime"},{"value":"79","label":"S77-MW Prime"},{"value":"8","label":"S6-MW Prime"},{"value":"80","label":"S78-MW Prime"},{"value":"81","label":"S79-MW Prime"},{"value":"82","label":"S80-MW Prime"},{"value":"83","label":"S81-MW Prime"},{"value":"84","label":"S82-MW Prime"},{"value":"85","label":"S83-MW Prime"},{"value":"86","label":"S84-MW Prime"},{"value":"87","label":"S85-MW Prime"},{"value":"88","label":"S86-MW Prime"},{"value":"89","label":"S87-MW Prime"},{"value":"9","label":"S7-MW Prime"},{"value":"90","label":"S88-MW Prime"},{"value":"91","label":"S89-MW Prime"},{"value":"92","label":"S90-MW Prime"},{"value":"93","label":"S91-MW Prime"},{"value":"94","label":"S92-MW Prime"},{"value":"95","label":"S93-MW Prime"},{"value":"96","label":"S94-MW Prime"},{"value":"97","label":"S95-MW Prime"},{"value":"98","label":"S96-MW Prime"},{"value":"99","label":"S97-MW Prime"}]	2025-11-12 13:17:55.114965
109	Punishing Gray Raven	serverId	select	Server	f	1	[{"value":"5000","label":"Asia-Pasific"},{"value":"5001","label":"Europe"},{"value":"5002","label":"North America"}]	2025-11-12 13:17:55.114965
110	Racing Master	gameId	text	User ID	f	0	\N	2025-11-12 13:17:55.114965
111	Ragnarok M Classic	gameId	number	User ID	f	0	\N	2025-11-12 13:17:55.114965
112	Ragnarok M Eternal Love	gameId	number	User ID	f	0	\N	2025-11-12 13:17:55.114965
113	Ragnarok M Eternal Love	serverId	select	Server	f	1	[{"value":"90001","label":"Eternal Love"},{"value":"90002","label":"Midnight Party"},{"value":"90002003","label":"Memory of Faith"},{"value":"90002004","label":"Valhalla Glory"},{"value":"90002005","label":"Port City"}]	2025-11-12 13:17:55.114965
114	Revelation Infinite Journey	gameId	number	User ID	f	0	\N	2025-11-12 13:17:55.114965
115	Super SUS	gameId	number	User ID	f	0	\N	2025-11-12 13:17:55.114965
116	Tarisland	gameId	number	User ID	f	0	\N	2025-11-12 13:17:55.114965
117	Tarisland	serverId	select	Server	f	1	[{"value":"ASIA-1","label":"ASIA-1"},{"value":"ASIA-10","label":"ASIA-10"},{"value":"ASIA-100","label":"ASIA-100"},{"value":"ASIA-11","label":"ASIA-11"},{"value":"ASIA-12","label":"ASIA-12"},{"value":"ASIA-13","label":"ASIA-13"},{"value":"ASIA-14","label":"ASIA-14"},{"value":"ASIA-15","label":"ASIA-15"},{"value":"ASIA-16","label":"ASIA-16"},{"value":"ASIA-17","label":"ASIA-17"},{"value":"ASIA-18","label":"ASIA-18"},{"value":"ASIA-19","label":"ASIA-19"},{"value":"ASIA-2","label":"ASIA-2"},{"value":"ASIA-20","label":"ASIA-20"},{"value":"ASIA-21","label":"ASIA-21"},{"value":"ASIA-22","label":"ASIA-22"},{"value":"ASIA-23","label":"ASIA-23"},{"value":"ASIA-24","label":"ASIA-24"},{"value":"ASIA-25","label":"ASIA-25"},{"value":"ASIA-26","label":"ASIA-26"},{"value":"ASIA-27","label":"ASIA-27"},{"value":"ASIA-28","label":"ASIA-28"},{"value":"ASIA-29","label":"ASIA-29"},{"value":"ASIA-3","label":"ASIA-3"},{"value":"ASIA-30","label":"ASIA-30"},{"value":"ASIA-31","label":"ASIA-31"},{"value":"ASIA-32","label":"ASIA-32"},{"value":"ASIA-33","label":"ASIA-33"},{"value":"ASIA-34","label":"ASIA-34"},{"value":"ASIA-35","label":"ASIA-35"},{"value":"ASIA-36","label":"ASIA-36"},{"value":"ASIA-37","label":"ASIA-37"},{"value":"ASIA-38","label":"ASIA-38"},{"value":"ASIA-39","label":"ASIA-39"},{"value":"ASIA-4","label":"ASIA-4"},{"value":"ASIA-40","label":"ASIA-40"},{"value":"ASIA-41","label":"ASIA-41"},{"value":"ASIA-42","label":"ASIA-42"},{"value":"ASIA-43","label":"ASIA-43"},{"value":"ASIA-44","label":"ASIA-44"},{"value":"ASIA-45","label":"ASIA-45"},{"value":"ASIA-46","label":"ASIA-46"},{"value":"ASIA-47","label":"ASIA-47"},{"value":"ASIA-48","label":"ASIA-48"},{"value":"ASIA-49","label":"ASIA-49"},{"value":"ASIA-5","label":"ASIA-5"},{"value":"ASIA-50","label":"ASIA-50"},{"value":"ASIA-51","label":"ASIA-51"},{"value":"ASIA-52","label":"ASIA-52"},{"value":"ASIA-53","label":"ASIA-53"},{"value":"ASIA-54","label":"ASIA-54"},{"value":"ASIA-55","label":"ASIA-55"},{"value":"ASIA-56","label":"ASIA-56"},{"value":"ASIA-57","label":"ASIA-57"},{"value":"ASIA-58","label":"ASIA-58"},{"value":"ASIA-59","label":"ASIA-59"},{"value":"ASIA-6","label":"ASIA-6"},{"value":"ASIA-60","label":"ASIA-60"},{"value":"ASIA-61","label":"ASIA-61"},{"value":"ASIA-62","label":"ASIA-62"},{"value":"ASIA-63","label":"ASIA-63"},{"value":"ASIA-64","label":"ASIA-64"},{"value":"ASIA-65","label":"ASIA-65"},{"value":"ASIA-66","label":"ASIA-66"},{"value":"ASIA-67","label":"ASIA-67"},{"value":"ASIA-68","label":"ASIA-68"},{"value":"ASIA-69","label":"ASIA-69"},{"value":"ASIA-7","label":"ASIA-7"},{"value":"ASIA-70","label":"ASIA-70"},{"value":"ASIA-71","label":"ASIA-71"},{"value":"ASIA-72","label":"ASIA-72"},{"value":"ASIA-73","label":"ASIA-73"},{"value":"ASIA-74","label":"ASIA-74"},{"value":"ASIA-75","label":"ASIA-75"},{"value":"ASIA-76","label":"ASIA-76"},{"value":"ASIA-77","label":"ASIA-77"},{"value":"ASIA-78","label":"ASIA-78"},{"value":"ASIA-79","label":"ASIA-79"},{"value":"ASIA-8","label":"ASIA-8"},{"value":"ASIA-80","label":"ASIA-80"},{"value":"ASIA-81","label":"ASIA-81"},{"value":"ASIA-82","label":"ASIA-82"},{"value":"ASIA-83","label":"ASIA-83"},{"value":"ASIA-84","label":"ASIA-84"},{"value":"ASIA-85","label":"ASIA-85"},{"value":"ASIA-86","label":"ASIA-86"},{"value":"ASIA-87","label":"ASIA-87"},{"value":"ASIA-88","label":"ASIA-88"},{"value":"ASIA-89","label":"ASIA-89"},{"value":"ASIA-9","label":"ASIA-9"},{"value":"ASIA-90","label":"ASIA-90"},{"value":"ASIA-91","label":"ASIA-91"},{"value":"ASIA-92","label":"ASIA-92"},{"value":"ASIA-93","label":"ASIA-93"},{"value":"ASIA-94","label":"ASIA-94"},{"value":"ASIA-95","label":"ASIA-95"},{"value":"ASIA-96","label":"ASIA-96"},{"value":"ASIA-97","label":"ASIA-97"},{"value":"ASIA-98","label":"ASIA-98"},{"value":"ASIA-99","label":"ASIA-99"},{"value":"EE-1","label":"EE-1"},{"value":"EE-10","label":"EE-10"},{"value":"EE-11","label":"EE-11"},{"value":"EE-12","label":"EE-12"},{"value":"EE-13","label":"EE-13"},{"value":"EE-14","label":"EE-14"},{"value":"EE-15","label":"EE-15"},{"value":"EE-16","label":"EE-16"},{"value":"EE-17","label":"EE-17"},{"value":"EE-18","label":"EE-18"},{"value":"EE-19","label":"EE-19"},{"value":"EE-2","label":"EE-2"},{"value":"EE-20","label":"EE-20"},{"value":"EE-21","label":"EE-21"},{"value":"EE-22","label":"EE-22"},{"value":"EE-23","label":"EE-23"},{"value":"EE-24","label":"EE-24"},{"value":"EE-25","label":"EE-25"},{"value":"EE-26","label":"EE-26"},{"value":"EE-27","label":"EE-27"},{"value":"EE-28","label":"EE-28"},{"value":"EE-29","label":"EE-29"},{"value":"EE-3","label":"EE-3"},{"value":"EE-30","label":"EE-30"},{"value":"EE-31","label":"EE-31"},{"value":"EE-32","label":"EE-32"},{"value":"EE-33","label":"EE-33"},{"value":"EE-34","label":"EE-34"},{"value":"EE-35","label":"EE-35"},{"value":"EE-36","label":"EE-36"},{"value":"EE-37","label":"EE-37"},{"value":"EE-38","label":"EE-38"},{"value":"EE-39","label":"EE-39"},{"value":"EE-4","label":"EE-4"},{"value":"EE-40","label":"EE-40"},{"value":"EE-41","label":"EE-41"},{"value":"EE-42","label":"EE-42"},{"value":"EE-43","label":"EE-43"},{"value":"EE-44","label":"EE-44"},{"value":"EE-45","label":"EE-45"},{"value":"EE-46","label":"EE-46"},{"value":"EE-47","label":"EE-47"},{"value":"EE-48","label":"EE-48"},{"value":"EE-49","label":"EE-49"},{"value":"EE-5","label":"EE-5"},{"value":"EE-50","label":"EE-50"},{"value":"EE-51","label":"EE-51"},{"value":"EE-52","label":"EE-52"},{"value":"EE-53","label":"EE-53"},{"value":"EE-54","label":"EE-54"},{"value":"EE-55","label":"EE-55"},{"value":"EE-56","label":"EE-56"},{"value":"EE-57","label":"EE-57"},{"value":"EE-58","label":"EE-58"},{"value":"EE-59","label":"EE-59"},{"value":"EE-6","label":"EE-6"},{"value":"EE-60","label":"EE-60"},{"value":"EE-61","label":"EE-61"},{"value":"EE-62","label":"EE-62"},{"value":"EE-63","label":"EE-63"},{"value":"EE-64","label":"EE-64"},{"value":"EE-65","label":"EE-65"},{"value":"EE-66","label":"EE-66"},{"value":"EE-67","label":"EE-67"},{"value":"EE-68","label":"EE-68"},{"value":"EE-69","label":"EE-69"},{"value":"EE-7","label":"EE-7"},{"value":"EE-70","label":"EE-70"},{"value":"EE-71","label":"EE-71"},{"value":"EE-72","label":"EE-72"},{"value":"EE-73","label":"EE-73"},{"value":"EE-74","label":"EE-74"},{"value":"EE-75","label":"EE-75"},{"value":"EE-76","label":"EE-76"},{"value":"EE-77","label":"EE-77"},{"value":"EE-78","label":"EE-78"},{"value":"EE-79","label":"EE-79"},{"value":"EE-8","label":"EE-8"},{"value":"EE-80","label":"EE-80"},{"value":"EE-81","label":"EE-81"},{"value":"EE-82","label":"EE-82"},{"value":"EE-83","label":"EE-83"},{"value":"EE-84","label":"EE-84"},{"value":"EE-85","label":"EE-85"},{"value":"EE-86","label":"EE-86"},{"value":"EE-87","label":"EE-87"},{"value":"EE-88","label":"EE-88"},{"value":"EE-89","label":"EE-89"},{"value":"EE-9","label":"EE-9"},{"value":"EE-90","label":"EE-90"},{"value":"EE-91","label":"EE-91"},{"value":"EE-92","label":"EE-92"},{"value":"EE-93","label":"EE-93"},{"value":"EE-94","label":"EE-94"},{"value":"EE-95","label":"EE-95"},{"value":"EE-96","label":"EE-96"},{"value":"EE-97","label":"EE-97"},{"value":"EE-98","label":"EE-98"},{"value":"EE-99","label":"EE-99"},{"value":"EU-1","label":"EU-1"},{"value":"EU-10","label":"EU-10"},{"value":"EU-100","label":"EU-100"},{"value":"EU-11","label":"EU-11"},{"value":"EU-12","label":"EU-12"},{"value":"EU-13","label":"EU-13"},{"value":"EU-14","label":"EU-14"},{"value":"EU-15","label":"EU-15"},{"value":"EU-16","label":"EU-16"},{"value":"EU-17","label":"EU-17"},{"value":"EU-18","label":"EU-18"},{"value":"EU-19","label":"EU-19"},{"value":"EU-2","label":"EU-2"},{"value":"EU-20","label":"EU-20"},{"value":"EU-21","label":"EU-21"},{"value":"EU-22","label":"EU-22"},{"value":"EU-23","label":"EU-23"},{"value":"EU-24","label":"EU-24"},{"value":"EU-25","label":"EU-25"},{"value":"EU-26","label":"EU-26"},{"value":"EU-27","label":"EU-27"},{"value":"EU-28","label":"EU-28"},{"value":"EU-29","label":"EU-29"},{"value":"EU-3","label":"EU-3"},{"value":"EU-30","label":"EU-30"},{"value":"EU-31","label":"EU-31"},{"value":"EU-32","label":"EU-32"},{"value":"EU-33","label":"EU-33"},{"value":"EU-34","label":"EU-34"},{"value":"EU-35","label":"EU-35"},{"value":"EU-36","label":"EU-36"},{"value":"EU-37","label":"EU-37"},{"value":"EU-38","label":"EU-38"},{"value":"EU-39","label":"EU-39"},{"value":"EU-4","label":"EU-4"},{"value":"EU-40","label":"EU-40"},{"value":"EU-41","label":"EU-41"},{"value":"EU-42","label":"EU-42"},{"value":"EU-43","label":"EU-43"},{"value":"EU-44","label":"EU-44"},{"value":"EU-45","label":"EU-45"},{"value":"EU-46","label":"EU-46"},{"value":"EU-47","label":"EU-47"},{"value":"EU-48","label":"EU-48"},{"value":"EU-49","label":"EU-49"},{"value":"EU-5","label":"EU-5"},{"value":"EU-50","label":"EU-50"},{"value":"EU-51","label":"EU-51"},{"value":"EU-52","label":"EU-52"},{"value":"EU-53","label":"EU-53"},{"value":"EU-54","label":"EU-54"},{"value":"EU-55","label":"EU-55"},{"value":"EU-56","label":"EU-56"},{"value":"EU-57","label":"EU-57"},{"value":"EU-58","label":"EU-58"},{"value":"EU-59","label":"EU-59"},{"value":"EU-6","label":"EU-6"},{"value":"EU-60","label":"EU-60"},{"value":"EU-61","label":"EU-61"},{"value":"EU-62","label":"EU-62"},{"value":"EU-63","label":"EU-63"},{"value":"EU-64","label":"EU-64"},{"value":"EU-65","label":"EU-65"},{"value":"EU-66","label":"EU-66"},{"value":"EU-67","label":"EU-67"},{"value":"EU-68","label":"EU-68"},{"value":"EU-69","label":"EU-69"},{"value":"EU-7","label":"EU-7"},{"value":"EU-70","label":"EU-70"},{"value":"EU-71","label":"EU-71"},{"value":"EU-72","label":"EU-72"},{"value":"EU-73","label":"EU-73"},{"value":"EU-74","label":"EU-74"},{"value":"EU-75","label":"EU-75"},{"value":"EU-76","label":"EU-76"},{"value":"EU-77","label":"EU-77"},{"value":"EU-78","label":"EU-78"},{"value":"EU-79","label":"EU-79"},{"value":"EU-8","label":"EU-8"},{"value":"EU-80","label":"EU-80"},{"value":"EU-81","label":"EU-81"},{"value":"EU-82","label":"EU-82"},{"value":"EU-83","label":"EU-83"},{"value":"EU-84","label":"EU-84"},{"value":"EU-85","label":"EU-85"},{"value":"EU-86","label":"EU-86"},{"value":"EU-87","label":"EU-87"},{"value":"EU-88","label":"EU-88"},{"value":"EU-89","label":"EU-89"},{"value":"EU-9","label":"EU-9"},{"value":"EU-90","label":"EU-90"},{"value":"EU-91","label":"EU-91"},{"value":"EU-92","label":"EU-92"},{"value":"EU-93","label":"EU-93"},{"value":"EU-94","label":"EU-94"},{"value":"EU-95","label":"EU-95"},{"value":"EU-96","label":"EU-96"},{"value":"EU-97","label":"EU-97"},{"value":"EU-98","label":"EU-98"},{"value":"EU-99","label":"EU-99"},{"value":"LATAM-1","label":"LATAM-1"},{"value":"LATAM-10","label":"LATAM-10"},{"value":"LATAM-100","label":"LATAM-100"},{"value":"LATAM-11","label":"LATAM-11"},{"value":"LATAM-12","label":"LATAM-12"},{"value":"LATAM-13","label":"LATAM-13"},{"value":"LATAM-14","label":"LATAM-14"},{"value":"LATAM-15","label":"LATAM-15"},{"value":"LATAM-16","label":"LATAM-16"},{"value":"LATAM-17","label":"LATAM-17"},{"value":"LATAM-18","label":"LATAM-18"},{"value":"LATAM-19","label":"LATAM-19"},{"value":"LATAM-2","label":"LATAM-2"},{"value":"LATAM-20","label":"LATAM-20"},{"value":"LATAM-21","label":"LATAM-21"},{"value":"LATAM-22","label":"LATAM-22"},{"value":"LATAM-23","label":"LATAM-23"},{"value":"LATAM-24","label":"LATAM-24"},{"value":"LATAM-25","label":"LATAM-25"},{"value":"LATAM-26","label":"LATAM-26"},{"value":"LATAM-27","label":"LATAM-27"},{"value":"LATAM-28","label":"LATAM-28"},{"value":"LATAM-29","label":"LATAM-29"},{"value":"LATAM-3","label":"LATAM-3"},{"value":"LATAM-30","label":"LATAM-30"},{"value":"LATAM-31","label":"LATAM-31"},{"value":"LATAM-32","label":"LATAM-32"},{"value":"LATAM-33","label":"LATAM-33"},{"value":"LATAM-34","label":"LATAM-34"},{"value":"LATAM-35","label":"LATAM-35"},{"value":"LATAM-36","label":"LATAM-36"},{"value":"LATAM-37","label":"LATAM-37"},{"value":"LATAM-38","label":"LATAM-38"},{"value":"LATAM-39","label":"LATAM-39"},{"value":"LATAM-4","label":"LATAM-4"},{"value":"LATAM-40","label":"LATAM-40"},{"value":"LATAM-41","label":"LATAM-41"},{"value":"LATAM-42","label":"LATAM-42"},{"value":"LATAM-43","label":"LATAM-43"},{"value":"LATAM-44","label":"LATAM-44"},{"value":"LATAM-45","label":"LATAM-45"},{"value":"LATAM-46","label":"LATAM-46"},{"value":"LATAM-47","label":"LATAM-47"},{"value":"LATAM-48","label":"LATAM-48"},{"value":"LATAM-49","label":"LATAM-49"},{"value":"LATAM-5","label":"LATAM-5"},{"value":"LATAM-50","label":"LATAM-50"},{"value":"LATAM-51","label":"LATAM-51"},{"value":"LATAM-52","label":"LATAM-52"},{"value":"LATAM-53","label":"LATAM-53"},{"value":"LATAM-54","label":"LATAM-54"},{"value":"LATAM-55","label":"LATAM-55"},{"value":"LATAM-56","label":"LATAM-56"},{"value":"LATAM-57","label":"LATAM-57"},{"value":"LATAM-58","label":"LATAM-58"},{"value":"LATAM-59","label":"LATAM-59"},{"value":"LATAM-6","label":"LATAM-6"},{"value":"LATAM-60","label":"LATAM-60"},{"value":"LATAM-61","label":"LATAM-61"},{"value":"LATAM-62","label":"LATAM-62"},{"value":"LATAM-63","label":"LATAM-63"},{"value":"LATAM-64","label":"LATAM-64"},{"value":"LATAM-65","label":"LATAM-65"},{"value":"LATAM-66","label":"LATAM-66"},{"value":"LATAM-67","label":"LATAM-67"},{"value":"LATAM-68","label":"LATAM-68"},{"value":"LATAM-69","label":"LATAM-69"},{"value":"LATAM-7","label":"LATAM-7"},{"value":"LATAM-70","label":"LATAM-70"},{"value":"LATAM-71","label":"LATAM-71"},{"value":"LATAM-72","label":"LATAM-72"},{"value":"LATAM-73","label":"LATAM-73"},{"value":"LATAM-74","label":"LATAM-74"},{"value":"LATAM-75","label":"LATAM-75"},{"value":"LATAM-76","label":"LATAM-76"},{"value":"LATAM-77","label":"LATAM-77"},{"value":"LATAM-78","label":"LATAM-78"},{"value":"LATAM-79","label":"LATAM-79"},{"value":"LATAM-8","label":"LATAM-8"},{"value":"LATAM-80","label":"LATAM-80"},{"value":"LATAM-81","label":"LATAM-81"},{"value":"LATAM-82","label":"LATAM-82"},{"value":"LATAM-83","label":"LATAM-83"},{"value":"LATAM-84","label":"LATAM-84"},{"value":"LATAM-85","label":"LATAM-85"},{"value":"LATAM-86","label":"LATAM-86"},{"value":"LATAM-87","label":"LATAM-87"},{"value":"LATAM-88","label":"LATAM-88"},{"value":"LATAM-89","label":"LATAM-89"},{"value":"LATAM-9","label":"LATAM-9"},{"value":"LATAM-90","label":"LATAM-90"},{"value":"LATAM-91","label":"LATAM-91"},{"value":"LATAM-92","label":"LATAM-92"},{"value":"LATAM-93","label":"LATAM-93"},{"value":"LATAM-94","label":"LATAM-94"},{"value":"LATAM-95","label":"LATAM-95"},{"value":"LATAM-96","label":"LATAM-96"},{"value":"LATAM-97","label":"LATAM-97"},{"value":"LATAM-98","label":"LATAM-98"},{"value":"LATAM-99","label":"LATAM-99"},{"value":"NA-1","label":"NA-1"},{"value":"NA-10","label":"NA-10"},{"value":"NA-100","label":"NA-100"},{"value":"NA-11","label":"NA-11"},{"value":"NA-12","label":"NA-12"},{"value":"NA-13","label":"NA-13"},{"value":"NA-14","label":"NA-14"},{"value":"NA-15","label":"NA-15"},{"value":"NA-16","label":"NA-16"},{"value":"NA-17","label":"NA-17"},{"value":"NA-18","label":"NA-18"},{"value":"NA-19","label":"NA-19"},{"value":"NA-2","label":"NA-2"},{"value":"NA-20","label":"NA-20"},{"value":"NA-21","label":"NA-21"},{"value":"NA-22","label":"NA-22"},{"value":"NA-23","label":"NA-23"},{"value":"NA-24","label":"NA-24"},{"value":"NA-25","label":"NA-25"},{"value":"NA-26","label":"NA-26"},{"value":"NA-27","label":"NA-27"},{"value":"NA-28","label":"NA-28"},{"value":"NA-29","label":"NA-29"},{"value":"NA-3","label":"NA-3"},{"value":"NA-30","label":"NA-30"},{"value":"NA-31","label":"NA-31"},{"value":"NA-32","label":"NA-32"},{"value":"NA-33","label":"NA-33"},{"value":"NA-34","label":"NA-34"},{"value":"NA-35","label":"NA-35"},{"value":"NA-36","label":"NA-36"},{"value":"NA-37","label":"NA-37"},{"value":"NA-38","label":"NA-38"},{"value":"NA-39","label":"NA-39"},{"value":"NA-4","label":"NA-4"},{"value":"NA-40","label":"NA-40"},{"value":"NA-41","label":"NA-41"},{"value":"NA-42","label":"NA-42"},{"value":"NA-43","label":"NA-43"},{"value":"NA-44","label":"NA-44"},{"value":"NA-45","label":"NA-45"},{"value":"NA-46","label":"NA-46"},{"value":"NA-47","label":"NA-47"},{"value":"NA-48","label":"NA-48"},{"value":"NA-49","label":"NA-49"},{"value":"NA-5","label":"NA-5"},{"value":"NA-50","label":"NA-50"},{"value":"NA-51","label":"NA-51"},{"value":"NA-52","label":"NA-52"},{"value":"NA-53","label":"NA-53"},{"value":"NA-54","label":"NA-54"},{"value":"NA-55","label":"NA-55"},{"value":"NA-56","label":"NA-56"},{"value":"NA-57","label":"NA-57"},{"value":"NA-58","label":"NA-58"},{"value":"NA-59","label":"NA-59"},{"value":"NA-6","label":"NA-6"},{"value":"NA-60","label":"NA-60"},{"value":"NA-61","label":"NA-61"},{"value":"NA-62","label":"NA-62"},{"value":"NA-63","label":"NA-63"},{"value":"NA-64","label":"NA-64"},{"value":"NA-65","label":"NA-65"},{"value":"NA-66","label":"NA-66"},{"value":"NA-67","label":"NA-67"},{"value":"NA-68","label":"NA-68"},{"value":"NA-69","label":"NA-69"},{"value":"NA-7","label":"NA-7"},{"value":"NA-70","label":"NA-70"},{"value":"NA-71","label":"NA-71"},{"value":"NA-72","label":"NA-72"},{"value":"NA-73","label":"NA-73"},{"value":"NA-74","label":"NA-74"},{"value":"NA-75","label":"NA-75"},{"value":"NA-76","label":"NA-76"},{"value":"NA-77","label":"NA-77"},{"value":"NA-78","label":"NA-78"},{"value":"NA-79","label":"NA-79"},{"value":"NA-8","label":"NA-8"},{"value":"NA-80","label":"NA-80"},{"value":"NA-81","label":"NA-81"},{"value":"NA-82","label":"NA-82"},{"value":"NA-83","label":"NA-83"},{"value":"NA-84","label":"NA-84"},{"value":"NA-85","label":"NA-85"},{"value":"NA-86","label":"NA-86"},{"value":"NA-87","label":"NA-87"},{"value":"NA-88","label":"NA-88"},{"value":"NA-89","label":"NA-89"},{"value":"NA-9","label":"NA-9"},{"value":"NA-90","label":"NA-90"},{"value":"NA-91","label":"NA-91"},{"value":"NA-92","label":"NA-92"},{"value":"NA-93","label":"NA-93"},{"value":"NA-94","label":"NA-94"},{"value":"NA-95","label":"NA-95"},{"value":"NA-96","label":"NA-96"},{"value":"NA-97","label":"NA-97"},{"value":"NA-98","label":"NA-98"},{"value":"NA-99","label":"NA-99"}]	2025-11-12 13:17:55.114965
118	Teamfight Tactics Mobile	gameId	text	Riot ID	f	0	\N	2025-11-12 13:17:55.114965
119	The Legend of Neverland	gameId	text	Character ID	f	0	\N	2025-11-12 13:17:55.114965
120	Valorant	gameId	text	User ID	f	0	\N	2025-11-12 13:17:55.114965
121	Wuthering Waves	gameId	number	User ID	f	0	\N	2025-11-12 13:17:55.114965
122	Wuthering Waves	serverId	select	Server	f	1	[{"value":"America","label":"America"},{"value":"Asia","label":"Asia"},{"value":"Europe","label":"Europe"},{"value":"SEA","label":"SEA"},{"value":"TW_HK_MO","label":"TW_HK_MO"}]	2025-11-12 13:17:55.114965
123	Zenless Zone Zero	gameId	number	User ID	f	0	\N	2025-11-12 13:17:55.114965
124	Zenless Zone Zero	serverId	select	Server ID	f	1	[{"value":"os_asia","label":"Asia"},{"value":"os_cht","label":"TW_HK_MO"},{"value":"os_euro","label":"Europe"},{"value":"os_usa","label":"America"}]	2025-11-12 13:17:55.114965
125	Zepeto	gameId	text	Username	f	0	\N	2025-11-12 13:17:55.114965
126	Bigo Live	gameId	number	Masukkan ID	f	0	\N	2025-11-12 13:17:55.114965
127	Captain Tsubasa Ace	username	text	Masukkan Username	f	1	\N	2025-11-12 13:17:55.114965
128	FOOTBALL RISING STAR	gameId	text	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
129	FOOTBALL RISING STAR	Platform	select	Pilih Server	f	1	[{"value":"1","label":"Android"},{"value":"2","label":"iOS"}]	2025-11-12 13:17:55.114965
130	Legacy Fate Sacred and Fearless	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
131	Legacy Fate Sacred and Fearless	serverId	select	Pilih Server	f	1	[{"value":"1","label":"Legacy"},{"value":"2","label":"Aspect"},{"value":"3","label":"Soros"},{"value":"4","label":"Eastston"},{"value":"5","label":"Spock"},{"value":"6","label":"Vertbutter"},{"value":"7","label":"Lambence"},{"value":"8","label":"Lumen"},{"value":"9","label":"Icebell"},{"value":"10","label":"Easthall"},{"value":"11","label":"Myrios"},{"value":"12","label":"Vape"},{"value":"13","label":"Jinx"},{"value":"14","label":"Aelley"},{"value":"15","label":"Eastmarsh"},{"value":"16","label":"Golem"},{"value":"17","label":"Echo"},{"value":"18","label":"Fluke"},{"value":"19","label":"Plasma"},{"value":"20","label":"Icefall"},{"value":"21","label":"Highash"},{"value":"22","label":"Glassford"},{"value":"23","label":"Precipe"},{"value":"24","label":"Heaf"},{"value":"25","label":"Avalan"},{"value":"26","label":"Acidosis"},{"value":"27","label":"Raymill"},{"value":"28","label":"Intra"},{"value":"29","label":"Genesis"},{"value":"30","label":"Icebush"},{"value":"31","label":"Glassedge"},{"value":"32","label":"Granit"},{"value":"33","label":"Saline"},{"value":"34","label":"Omega"},{"value":"35","label":"Salis"},{"value":"36","label":"Oldbutter"},{"value":"37","label":"Beachgate"},{"value":"38","label":"Oria"},{"value":"39","label":"Mageburn"},{"value":"40","label":"Optix"},{"value":"41","label":"Butler"},{"value":"42","label":"Animax"},{"value":"43","label":"Aurora"},{"value":"44","label":"Wayhill"},{"value":"45","label":"Whiff"},{"value":"46","label":"Glasslea"},{"value":"47","label":"Pinewall"},{"value":"48","label":"Deepholt"},{"value":"49","label":"Kindle"},{"value":"50","label":"Fenix"},{"value":"51","label":"Clipse"},{"value":"52","label":"Aldapple"},{"value":"53","label":"Pinepond"},{"value":"54","label":"Smoldris"},{"value":"55","label":"Aelston"},{"value":"10001","label":"Fate"},{"value":"10002","label":"Hayden"},{"value":"10003","label":"Dorhill"},{"value":"10004","label":"Aeetes"},{"value":"10005","label":"Scarlet"},{"value":"10006","label":"Ara"},{"value":"10007","label":"Alcyoneus"},{"value":"10008","label":"Gavin"},{"value":"10009","label":"Cassiopeia"},{"value":"10010","label":"Aquila"},{"value":"10011","label":"Epeius"},{"value":"10012","label":"Cygnus"},{"value":"10013","label":"Victor"},{"value":"10014","label":"Pyxis"},{"value":"10015","label":"Remington"},{"value":"10016","label":"Triangulum"},{"value":"10017","label":"Narthex"},{"value":"10018","label":"Theseus"},{"value":"10019","label":"Bramwell"},{"value":"10020","label":"Stentor"},{"value":"10021","label":"Peleus"},{"value":"10022","label":"Artemis"},{"value":"10023","label":"Achilles"},{"value":"10024","label":"Priams"},{"value":"10025","label":"Sphinx"},{"value":"20001","label":"Fearless"},{"value":"20002","label":"Bluesage"},{"value":"20003","label":"Tethys"},{"value":"20004","label":"Taygetea"},{"value":"20005","label":"Westerwyn"},{"value":"20006","label":"Arethusa"},{"value":"20007","label":"Marblemage"},{"value":"20008","label":"Sao"},{"value":"20009","label":"Lorfort"},{"value":"20010","label":"Akheron"},{"value":"20011","label":"Esteroak"},{"value":"20012","label":"Herse"},{"value":"20013","label":"Nepturne"},{"value":"20014","label":"Eulimene"},{"value":"20015","label":"Menoetes"},{"value":"20016","label":"Themis"},{"value":"20017","label":"Bacchus"},{"value":"20018","label":"Dynamene"},{"value":"20019","label":"Westlea"},{"value":"20020","label":"Akheilos"},{"value":"20021","label":"Euryale"},{"value":"20022","label":"Fielddell"},{"value":"20023","label":"Greydale"},{"value":"20024","label":"Halie"},{"value":"20025","label":"Westwilde"},{"value":"20026","label":"Flora"},{"value":"20027","label":"Eunice"},{"value":"20028","label":"Doto"}]	2025-11-12 13:17:55.114965
132	Legend of Mushroom Rush	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
133	Legend of Mushroom Rush	serverId	select	Pilih Server	f	1	[{"value":"7700","label":"ID_700"},{"value":"7699","label":"ID_699"},{"value":"7698","label":"ID_698"},{"value":"7697","label":"ID_697"},{"value":"7696","label":"ID_696"},{"value":"7695","label":"ID_695"},{"value":"7694","label":"ID_694"},{"value":"7693","label":"ID_693"},{"value":"7692","label":"ID_692"},{"value":"7691","label":"ID_691"},{"value":"7690","label":"ID_690"},{"value":"7689","label":"ID_689"},{"value":"7688","label":"ID_688"},{"value":"7687","label":"ID_687"},{"value":"7686","label":"ID_686"},{"value":"7685","label":"ID_685"},{"value":"7684","label":"ID_684"},{"value":"7683","label":"ID_683"},{"value":"7682","label":"ID_682"},{"value":"7681","label":"ID_681"},{"value":"7680","label":"ID_680"},{"value":"7679","label":"ID_679"},{"value":"7678","label":"ID_678"},{"value":"7677","label":"ID_677"},{"value":"7676","label":"ID_676"},{"value":"7675","label":"ID_675"},{"value":"7674","label":"ID_674"},{"value":"7673","label":"ID_673"},{"value":"7672","label":"ID_672"},{"value":"7671","label":"ID_671"},{"value":"7670","label":"ID_670"},{"value":"7669","label":"ID_669"},{"value":"7668","label":"ID_668"},{"value":"7667","label":"ID_667"},{"value":"7666","label":"ID_666"},{"value":"7665","label":"ID_665"},{"value":"7664","label":"ID_664"},{"value":"7663","label":"ID_663"},{"value":"7662","label":"ID_662"},{"value":"7661","label":"ID_661"},{"value":"7660","label":"ID_660"},{"value":"7659","label":"ID_659"},{"value":"7658","label":"ID_658"},{"value":"7657","label":"ID_657"},{"value":"7656","label":"ID_656"},{"value":"7655","label":"ID_655"},{"value":"7654","label":"ID_654"},{"value":"7653","label":"ID_653"},{"value":"7652","label":"ID_652"},{"value":"7651","label":"ID_651"},{"value":"7650","label":"ID_650"},{"value":"7649","label":"ID_649"},{"value":"7648","label":"ID_648"},{"value":"7647","label":"ID_647"},{"value":"7646","label":"ID_646"},{"value":"7645","label":"ID_645"},{"value":"7644","label":"ID_644"},{"value":"7643","label":"ID_643"},{"value":"7642","label":"ID_642"},{"value":"7641","label":"ID_641"},{"value":"7640","label":"ID_640"},{"value":"7639","label":"ID_639"},{"value":"7638","label":"ID_638"},{"value":"7637","label":"ID_637"},{"value":"7636","label":"ID_636"},{"value":"7635","label":"ID_635"},{"value":"7634","label":"ID_634"},{"value":"7633","label":"ID_633"},{"value":"7632","label":"ID_632"},{"value":"7631","label":"ID_631"},{"value":"7630","label":"ID_630"},{"value":"7629","label":"ID_629"},{"value":"7628","label":"ID_628"},{"value":"7627","label":"ID_627"},{"value":"7626","label":"ID_626"},{"value":"7625","label":"ID_625"},{"value":"7624","label":"ID_624"},{"value":"7623","label":"ID_623"},{"value":"7622","label":"ID_622"},{"value":"7621","label":"ID_621"},{"value":"7620","label":"ID_620"},{"value":"7619","label":"ID_619"},{"value":"7618","label":"ID_618"},{"value":"7617","label":"ID_617"},{"value":"7616","label":"ID_616"},{"value":"7615","label":"ID_615"},{"value":"7614","label":"ID_614"},{"value":"7613","label":"ID_613"},{"value":"7612","label":"ID_612"},{"value":"7611","label":"ID_611"},{"value":"7610","label":"ID_610"},{"value":"7609","label":"ID_609"},{"value":"7608","label":"ID_608"},{"value":"7607","label":"ID_607"},{"value":"7606","label":"ID_606"},{"value":"7605","label":"ID_605"},{"value":"7604","label":"ID_604"},{"value":"7603","label":"ID_603"},{"value":"7602","label":"ID_602"},{"value":"7601","label":"ID_601"},{"value":"7600","label":"ID_600"},{"value":"7599","label":"ID_599"},{"value":"7598","label":"ID_598"},{"value":"7597","label":"ID_597"},{"value":"7596","label":"ID_596"},{"value":"7595","label":"ID_595"},{"value":"7594","label":"ID_594"},{"value":"7593","label":"ID_593"},{"value":"7592","label":"ID_592"},{"value":"7591","label":"ID_591"},{"value":"7590","label":"ID_590"},{"value":"7589","label":"ID_589"},{"value":"7588","label":"ID_588"},{"value":"7587","label":"ID_587"},{"value":"7586","label":"ID_586"},{"value":"7585","label":"ID_585"},{"value":"7584","label":"ID_584"},{"value":"7583","label":"ID_583"},{"value":"7582","label":"ID_582"},{"value":"7581","label":"ID_581"},{"value":"7580","label":"ID_580"},{"value":"7579","label":"ID_579"},{"value":"7578","label":"ID_578"},{"value":"7577","label":"ID_577"},{"value":"7576","label":"ID_576"},{"value":"7575","label":"ID_575"},{"value":"7574","label":"ID_574"},{"value":"7573","label":"ID_573"},{"value":"7572","label":"ID_572"},{"value":"7571","label":"ID_571"},{"value":"7570","label":"ID_570"},{"value":"7569","label":"ID_569"},{"value":"7568","label":"ID_568"},{"value":"7567","label":"ID_567"},{"value":"7566","label":"ID_566"},{"value":"7565","label":"ID_565"},{"value":"7564","label":"ID_564"},{"value":"7563","label":"ID_563"},{"value":"7562","label":"ID_562"},{"value":"7561","label":"ID_561"},{"value":"7560","label":"ID_560"},{"value":"7559","label":"ID_559"},{"value":"7558","label":"ID_558"},{"value":"7557","label":"ID_557"},{"value":"7556","label":"ID_556"},{"value":"7555","label":"ID_555"},{"value":"7554","label":"ID_554"},{"value":"7553","label":"ID_553"},{"value":"7552","label":"ID_552"},{"value":"7551","label":"ID_551"},{"value":"7550","label":"ID_550"},{"value":"7549","label":"ID_549"},{"value":"7548","label":"ID_548"},{"value":"7547","label":"ID_547"},{"value":"7546","label":"ID_546"},{"value":"7545","label":"ID_545"},{"value":"7544","label":"ID_544"},{"value":"7543","label":"ID_543"},{"value":"7542","label":"ID_542"},{"value":"7541","label":"ID_541"},{"value":"7540","label":"ID_540"},{"value":"7539","label":"ID_539"},{"value":"7538","label":"ID_538"},{"value":"7537","label":"ID_537"},{"value":"7536","label":"ID_536"},{"value":"7535","label":"ID_535"},{"value":"7534","label":"ID_534"},{"value":"7533","label":"ID_533"},{"value":"7532","label":"ID_532"},{"value":"7531","label":"ID_531"},{"value":"7530","label":"ID_530"},{"value":"7529","label":"ID_529"},{"value":"7528","label":"ID_528"},{"value":"7527","label":"ID_527"},{"value":"7526","label":"ID_526"},{"value":"7525","label":"ID_525"},{"value":"7524","label":"ID_524"},{"value":"7523","label":"ID_523"},{"value":"7522","label":"ID_522"},{"value":"7521","label":"ID_521"},{"value":"7520","label":"ID_520"},{"value":"7519","label":"ID_519"},{"value":"7518","label":"ID_518"},{"value":"7517","label":"ID_517"},{"value":"7516","label":"ID_516"},{"value":"7515","label":"ID_515"},{"value":"7514","label":"ID_514"},{"value":"7513","label":"ID_513"},{"value":"7512","label":"ID_512"},{"value":"7511","label":"ID_511"},{"value":"7510","label":"ID_510"},{"value":"7509","label":"ID_509"},{"value":"7508","label":"ID_508"},{"value":"7507","label":"ID_507"},{"value":"7506","label":"ID_506"},{"value":"7505","label":"ID_505"},{"value":"7504","label":"ID_504"},{"value":"7503","label":"ID_503"},{"value":"7502","label":"ID_502"},{"value":"7501","label":"ID_501"},{"value":"7500","label":"ID_500"},{"value":"7499","label":"ID_499"},{"value":"7498","label":"ID_498"},{"value":"7497","label":"ID_497"},{"value":"7496","label":"ID_496"},{"value":"7495","label":"ID_495"},{"value":"7494","label":"ID_494"},{"value":"7493","label":"ID_493"},{"value":"7492","label":"ID_492"},{"value":"7491","label":"ID_491"},{"value":"7490","label":"ID_490"},{"value":"7489","label":"ID_489"},{"value":"7488","label":"ID_488"},{"value":"7487","label":"ID_487"},{"value":"7486","label":"ID_486"},{"value":"7485","label":"ID_485"},{"value":"7484","label":"ID_484"},{"value":"7483","label":"ID_483"},{"value":"7482","label":"ID_482"},{"value":"7481","label":"ID_481"},{"value":"7480","label":"ID_480"},{"value":"7479","label":"ID_479"},{"value":"7478","label":"ID_478"},{"value":"7477","label":"ID_477"},{"value":"7476","label":"ID_476"},{"value":"7475","label":"ID_475"},{"value":"7474","label":"ID_474"},{"value":"7473","label":"ID_473"},{"value":"7472","label":"ID_472"},{"value":"7471","label":"ID_471"},{"value":"7470","label":"ID_470"},{"value":"7469","label":"ID_469"},{"value":"7468","label":"ID_468"},{"value":"7467","label":"ID_467"},{"value":"7466","label":"ID_466"},{"value":"7465","label":"ID_465"},{"value":"7464","label":"ID_464"},{"value":"7463","label":"ID_463"},{"value":"7462","label":"ID_462"},{"value":"7461","label":"ID_461"},{"value":"7460","label":"ID_460"},{"value":"7459","label":"ID_459"},{"value":"7458","label":"ID_458"},{"value":"7457","label":"ID_457"},{"value":"7456","label":"ID_456"},{"value":"7455","label":"ID_455"},{"value":"7454","label":"ID_454"},{"value":"7453","label":"ID_453"},{"value":"7452","label":"ID_452"},{"value":"7451","label":"ID_451"},{"value":"7450","label":"ID_450"},{"value":"7449","label":"ID_449"},{"value":"7448","label":"ID_448"},{"value":"7447","label":"ID_447"},{"value":"7446","label":"ID_446"},{"value":"7445","label":"ID_445"},{"value":"7444","label":"ID_444"},{"value":"7443","label":"ID_443"},{"value":"7442","label":"ID_442"},{"value":"7441","label":"ID_441"},{"value":"7440","label":"ID_440"},{"value":"7439","label":"ID_439"},{"value":"7438","label":"ID_438"},{"value":"7437","label":"ID_437"},{"value":"7436","label":"ID_436"},{"value":"7435","label":"ID_435"},{"value":"7434","label":"ID_434"},{"value":"7433","label":"ID_433"},{"value":"7432","label":"ID_432"},{"value":"7431","label":"ID_431"},{"value":"7430","label":"ID_430"},{"value":"7429","label":"ID_429"},{"value":"7428","label":"ID_428"},{"value":"7427","label":"ID_427"},{"value":"7426","label":"ID_426"},{"value":"7425","label":"ID_425"},{"value":"7424","label":"ID_424"},{"value":"7423","label":"ID_423"},{"value":"7422","label":"ID_422"},{"value":"7421","label":"ID_421"},{"value":"7420","label":"ID_420"},{"value":"7419","label":"ID_419"},{"value":"7418","label":"ID_418"},{"value":"7417","label":"ID_417"},{"value":"7416","label":"ID_416"},{"value":"7415","label":"ID_415"},{"value":"7414","label":"ID_414"},{"value":"7413","label":"ID_413"},{"value":"7412","label":"ID_412"},{"value":"7411","label":"ID_411"},{"value":"7410","label":"ID_410"},{"value":"7409","label":"ID_409"},{"value":"7408","label":"ID_408"},{"value":"7407","label":"ID_407"},{"value":"7406","label":"ID_406"},{"value":"7405","label":"ID_405"},{"value":"7404","label":"ID_404"},{"value":"7403","label":"ID_403"},{"value":"7402","label":"ID_402"},{"value":"7401","label":"ID_401"},{"value":"7400","label":"ID_400"},{"value":"7399","label":"ID_399"},{"value":"7398","label":"ID_398"},{"value":"7397","label":"ID_397"},{"value":"7396","label":"ID_396"},{"value":"7395","label":"ID_395"},{"value":"7394","label":"ID_394"},{"value":"7393","label":"ID_393"},{"value":"7392","label":"ID_392"},{"value":"7391","label":"ID_391"},{"value":"7390","label":"ID_390"},{"value":"7389","label":"ID_389"},{"value":"7388","label":"ID_388"},{"value":"7387","label":"ID_387"},{"value":"7386","label":"ID_386"},{"value":"7385","label":"ID_385"},{"value":"7384","label":"ID_384"},{"value":"7383","label":"ID_383"},{"value":"7382","label":"ID_382"},{"value":"7381","label":"ID_381"},{"value":"7380","label":"ID_380"},{"value":"7379","label":"ID_379"},{"value":"7378","label":"ID_378"},{"value":"7377","label":"ID_377"},{"value":"7376","label":"ID_376"},{"value":"7375","label":"ID_375"},{"value":"7374","label":"ID_374"},{"value":"7373","label":"ID_373"},{"value":"7372","label":"ID_372"},{"value":"7371","label":"ID_371"},{"value":"7370","label":"ID_370"},{"value":"7369","label":"ID_369"},{"value":"7368","label":"ID_368"},{"value":"7367","label":"ID_367"},{"value":"7366","label":"ID_366"},{"value":"7365","label":"ID_365"},{"value":"7364","label":"ID_364"},{"value":"7363","label":"ID_363"},{"value":"7362","label":"ID_362"},{"value":"7361","label":"ID_361"},{"value":"7360","label":"ID_360"},{"value":"7359","label":"ID_359"},{"value":"7358","label":"ID_358"},{"value":"7357","label":"ID_357"},{"value":"7356","label":"ID_356"},{"value":"7355","label":"ID_355"},{"value":"7354","label":"ID_354"},{"value":"7353","label":"ID_353"},{"value":"7352","label":"ID_352"},{"value":"7351","label":"ID_351"},{"value":"7350","label":"ID_350"},{"value":"7349","label":"ID_349"},{"value":"7348","label":"ID_348"},{"value":"7347","label":"ID_347"},{"value":"7346","label":"ID_346"},{"value":"7345","label":"ID_345"},{"value":"7344","label":"ID_344"},{"value":"7343","label":"ID_343"},{"value":"7342","label":"ID_342"},{"value":"7341","label":"ID_341"},{"value":"7340","label":"ID_340"},{"value":"7339","label":"ID_339"},{"value":"7338","label":"ID_338"},{"value":"7337","label":"ID_337"},{"value":"7336","label":"ID_336"},{"value":"7335","label":"ID_335"},{"value":"7334","label":"ID_334"},{"value":"7333","label":"ID_333"},{"value":"7332","label":"ID_332"},{"value":"7331","label":"ID_331"},{"value":"7330","label":"ID_330"},{"value":"7329","label":"ID_329"},{"value":"7328","label":"ID_328"},{"value":"7327","label":"ID_327"},{"value":"7326","label":"ID_326"},{"value":"7325","label":"ID_325"},{"value":"7324","label":"ID_324"},{"value":"7323","label":"ID_323"},{"value":"7322","label":"ID_322"},{"value":"7321","label":"ID_321"},{"value":"7320","label":"ID_320"},{"value":"7319","label":"ID_319"},{"value":"7318","label":"ID_318"},{"value":"7317","label":"ID_317"},{"value":"7316","label":"ID_316"},{"value":"7315","label":"ID_315"},{"value":"7314","label":"ID_314"},{"value":"7313","label":"ID_313"},{"value":"7312","label":"ID_312"},{"value":"7311","label":"ID_311"},{"value":"7310","label":"ID_310"},{"value":"7309","label":"ID_309"},{"value":"7308","label":"ID_308"},{"value":"7307","label":"ID_307"},{"value":"7306","label":"ID_306"},{"value":"7305","label":"ID_305"},{"value":"7304","label":"ID_304"},{"value":"7303","label":"ID_303"},{"value":"7302","label":"ID_302"},{"value":"7301","label":"ID_301"},{"value":"7300","label":"ID_300"},{"value":"7299","label":"ID_299"},{"value":"7298","label":"ID_298"},{"value":"7297","label":"ID_297"},{"value":"7296","label":"ID_296"},{"value":"7295","label":"ID_295"},{"value":"7294","label":"ID_294"},{"value":"7293","label":"ID_293"},{"value":"7292","label":"ID_292"},{"value":"7291","label":"ID_291"},{"value":"7290","label":"ID_290"},{"value":"7289","label":"ID_289"},{"value":"7288","label":"ID_288"},{"value":"7287","label":"ID_287"},{"value":"7286","label":"ID_286"},{"value":"7285","label":"ID_285"},{"value":"7284","label":"ID_284"},{"value":"7283","label":"ID_283"},{"value":"7282","label":"ID_282"},{"value":"7281","label":"ID_281"},{"value":"7280","label":"ID_280"},{"value":"7279","label":"ID_279"},{"value":"7278","label":"ID_278"},{"value":"7277","label":"ID_277"},{"value":"7276","label":"ID_276"},{"value":"7275","label":"ID_275"},{"value":"7274","label":"ID_274"},{"value":"7273","label":"ID_273"},{"value":"7272","label":"ID_272"},{"value":"7271","label":"ID_271"},{"value":"7270","label":"ID_270"},{"value":"7269","label":"ID_269"},{"value":"7268","label":"ID_268"},{"value":"7267","label":"ID_267"},{"value":"7266","label":"ID_266"},{"value":"7265","label":"ID_265"},{"value":"7264","label":"ID_264"},{"value":"7263","label":"ID_263"},{"value":"7262","label":"ID_262"},{"value":"7261","label":"ID_261"},{"value":"7260","label":"ID_260"},{"value":"7259","label":"ID_259"},{"value":"7258","label":"ID_258"},{"value":"7257","label":"ID_257"},{"value":"7256","label":"ID_256"},{"value":"7255","label":"ID_255"},{"value":"7254","label":"ID_254"},{"value":"7253","label":"ID_253"},{"value":"7252","label":"ID_252"},{"value":"7251","label":"ID_251"},{"value":"7250","label":"ID_250"},{"value":"7249","label":"ID_249"},{"value":"7248","label":"ID_248"},{"value":"7247","label":"ID_247"},{"value":"7246","label":"ID_246"},{"value":"7245","label":"ID_245"},{"value":"7244","label":"ID_244"},{"value":"7243","label":"ID_243"},{"value":"7242","label":"ID_242"},{"value":"7241","label":"ID_241"},{"value":"7240","label":"ID_240"},{"value":"7239","label":"ID_239"},{"value":"7238","label":"ID_238"},{"value":"7237","label":"ID_237"},{"value":"7236","label":"ID_236"},{"value":"7235","label":"ID_235"},{"value":"7234","label":"ID_234"},{"value":"7233","label":"ID_233"},{"value":"7232","label":"ID_232"},{"value":"7231","label":"ID_231"},{"value":"7230","label":"ID_230"},{"value":"7229","label":"ID_229"},{"value":"7228","label":"ID_228"},{"value":"7227","label":"ID_227"},{"value":"7226","label":"ID_226"},{"value":"7225","label":"ID_225"},{"value":"7224","label":"ID_224"},{"value":"7223","label":"ID_223"},{"value":"7222","label":"ID_222"},{"value":"7221","label":"ID_221"},{"value":"7220","label":"ID_220"},{"value":"7219","label":"ID_219"},{"value":"7218","label":"ID_218"},{"value":"7217","label":"ID_217"},{"value":"7216","label":"ID_216"},{"value":"7215","label":"ID_215"},{"value":"7214","label":"ID_214"},{"value":"7213","label":"ID_213"},{"value":"7212","label":"ID_212"},{"value":"7211","label":"ID_211"},{"value":"7210","label":"ID_210"},{"value":"7209","label":"ID_209"},{"value":"7208","label":"ID_208"},{"value":"7207","label":"ID_207"},{"value":"7206","label":"ID_206"},{"value":"7205","label":"ID_205"},{"value":"7204","label":"ID_204"},{"value":"7203","label":"ID_203"},{"value":"7202","label":"ID_202"},{"value":"7201","label":"ID_201"},{"value":"7200","label":"ID_200"},{"value":"7199","label":"ID_199"},{"value":"7198","label":"ID_198"},{"value":"7197","label":"ID_197"},{"value":"7196","label":"ID_196"},{"value":"7195","label":"ID_195"},{"value":"7194","label":"ID_194"},{"value":"7193","label":"ID_193"},{"value":"7192","label":"ID_192"},{"value":"7191","label":"ID_191"},{"value":"7190","label":"ID_190"},{"value":"7189","label":"ID_189"},{"value":"7188","label":"ID_188"},{"value":"7187","label":"ID_187"},{"value":"7186","label":"ID_186"},{"value":"7185","label":"ID_185"},{"value":"7184","label":"ID_184"},{"value":"7183","label":"ID_183"},{"value":"7182","label":"ID_182"},{"value":"7181","label":"ID_181"},{"value":"7180","label":"ID_180"},{"value":"7179","label":"ID_179"},{"value":"7178","label":"ID_178"},{"value":"7177","label":"ID_177"},{"value":"7176","label":"ID_176"},{"value":"7175","label":"ID_175"},{"value":"7174","label":"ID_174"},{"value":"7173","label":"ID_173"},{"value":"7172","label":"ID_172"},{"value":"7171","label":"ID_171"},{"value":"7170","label":"ID_170"},{"value":"7169","label":"ID_169"},{"value":"7168","label":"ID_168"},{"value":"7167","label":"ID_167"},{"value":"7166","label":"ID_166"},{"value":"7165","label":"ID_165"},{"value":"7164","label":"ID_164"},{"value":"7163","label":"ID_163"},{"value":"7162","label":"ID_162"},{"value":"7161","label":"ID_161"},{"value":"7160","label":"ID_160"},{"value":"7159","label":"ID_159"},{"value":"7158","label":"ID_158"},{"value":"7157","label":"ID_157"},{"value":"7156","label":"ID_156"},{"value":"7155","label":"ID_155"},{"value":"7154","label":"ID_154"},{"value":"7153","label":"ID_153"},{"value":"7152","label":"ID_152"},{"value":"7151","label":"ID_151"},{"value":"7150","label":"ID_150"},{"value":"7149","label":"ID_149"},{"value":"7148","label":"ID_148"},{"value":"7147","label":"ID_147"},{"value":"7146","label":"ID_146"},{"value":"7145","label":"ID_145"},{"value":"7144","label":"ID_144"},{"value":"7143","label":"ID_143"},{"value":"7142","label":"ID_142"},{"value":"7141","label":"ID_141"},{"value":"7140","label":"ID_140"},{"value":"7139","label":"ID_139"},{"value":"7138","label":"ID_138"},{"value":"7137","label":"ID_137"},{"value":"7136","label":"ID_136"},{"value":"7135","label":"ID_135"},{"value":"7134","label":"ID_134"},{"value":"7133","label":"ID_133"},{"value":"7132","label":"ID_132"},{"value":"7131","label":"ID_131"},{"value":"7130","label":"ID_130"},{"value":"7129","label":"ID_129"},{"value":"7128","label":"ID_128"},{"value":"7127","label":"ID_127"},{"value":"7126","label":"ID_126"},{"value":"7125","label":"ID_125"},{"value":"7124","label":"ID_124"},{"value":"7123","label":"ID_123"},{"value":"7122","label":"ID_122"},{"value":"7121","label":"ID_121"},{"value":"7120","label":"ID_120"},{"value":"7119","label":"ID_119"},{"value":"7118","label":"ID_118"},{"value":"7117","label":"ID_117"},{"value":"7116","label":"ID_116"},{"value":"7115","label":"ID_115"},{"value":"7114","label":"ID_114"},{"value":"7113","label":"ID_113"},{"value":"7112","label":"ID_112"},{"value":"7111","label":"ID_111"},{"value":"7110","label":"ID_110"},{"value":"7109","label":"ID_109"},{"value":"7108","label":"ID_108"},{"value":"7107","label":"ID_107"},{"value":"7106","label":"ID_106"},{"value":"7105","label":"ID_105"},{"value":"7104","label":"ID_104"},{"value":"7103","label":"ID_103"},{"value":"7102","label":"ID_102"},{"value":"7101","label":"ID_101"},{"value":"7100","label":"ID_100"},{"value":"7099","label":"ID_99"},{"value":"7098","label":"ID_98"},{"value":"7097","label":"ID_97"},{"value":"7096","label":"ID_96"},{"value":"7095","label":"ID_95"},{"value":"7094","label":"ID_94"},{"value":"7093","label":"ID_93"},{"value":"7092","label":"ID_92"},{"value":"7091","label":"ID_91"},{"value":"7090","label":"ID_90"},{"value":"7089","label":"ID_89"},{"value":"7088","label":"ID_88"},{"value":"7087","label":"ID_87"},{"value":"7086","label":"ID_86"},{"value":"7085","label":"ID_85"},{"value":"7084","label":"ID_84"},{"value":"7083","label":"ID_83"},{"value":"7082","label":"ID_82"},{"value":"7081","label":"ID_81"},{"value":"7080","label":"ID_80"},{"value":"7079","label":"ID_79"},{"value":"7078","label":"ID_78"},{"value":"7077","label":"ID_77"},{"value":"7076","label":"ID_76"},{"value":"7075","label":"ID_75"},{"value":"7074","label":"ID_74"},{"value":"7073","label":"ID_73"},{"value":"7072","label":"ID_72"},{"value":"7071","label":"ID_71"},{"value":"7070","label":"ID_70"},{"value":"7069","label":"ID_69"},{"value":"7068","label":"ID_68"},{"value":"7067","label":"ID_67"},{"value":"7066","label":"ID_66"},{"value":"7065","label":"ID_65"},{"value":"7064","label":"ID_64"},{"value":"7063","label":"ID_63"},{"value":"7062","label":"ID_62"},{"value":"7061","label":"ID_61"},{"value":"7060","label":"ID_60"},{"value":"7059","label":"ID_59"},{"value":"7058","label":"ID_58"},{"value":"7057","label":"ID_57"},{"value":"7056","label":"ID_56"},{"value":"7055","label":"ID_55"},{"value":"7054","label":"ID_54"},{"value":"7053","label":"ID_53"},{"value":"7052","label":"ID_52"},{"value":"7051","label":"ID_51"},{"value":"7050","label":"ID_50"},{"value":"7049","label":"ID_49"},{"value":"7048","label":"ID_48"},{"value":"7047","label":"ID_47"},{"value":"7046","label":"ID_46"},{"value":"7045","label":"ID_45"},{"value":"7044","label":"ID_44"},{"value":"7043","label":"ID_43"},{"value":"7042","label":"ID_42"},{"value":"7041","label":"ID_41"},{"value":"7040","label":"ID_40"},{"value":"7039","label":"ID_39"},{"value":"7038","label":"ID_38"},{"value":"7037","label":"ID_37"},{"value":"7036","label":"ID_36"},{"value":"7035","label":"ID_35"},{"value":"7034","label":"ID_34"},{"value":"7033","label":"ID_33"},{"value":"7032","label":"ID_32"},{"value":"7031","label":"ID_31"},{"value":"7030","label":"ID_30"},{"value":"7029","label":"ID_29"},{"value":"7028","label":"ID_28"},{"value":"7027","label":"ID_27"},{"value":"7026","label":"ID_26"},{"value":"7025","label":"ID_25"},{"value":"7024","label":"ID_24"},{"value":"7023","label":"ID_23"},{"value":"7022","label":"ID_22"},{"value":"7021","label":"ID_21"},{"value":"7020","label":"ID_20"},{"value":"7019","label":"ID_19"},{"value":"7018","label":"ID_18"},{"value":"7017","label":"ID_17"},{"value":"7016","label":"ID_16"},{"value":"7015","label":"ID_15"},{"value":"7014","label":"ID_14"},{"value":"7013","label":"ID_13"},{"value":"7012","label":"ID_12"},{"value":"7011","label":"ID_11"},{"value":"7010","label":"ID_10"},{"value":"7009","label":"ID_9"},{"value":"7008","label":"ID_8"},{"value":"7007","label":"ID_7"},{"value":"7006","label":"ID_6"},{"value":"7005","label":"ID_5"},{"value":"7004","label":"ID_4"},{"value":"7003","label":"ID_3"},{"value":"7002","label":"ID_2"},{"value":"7001","label":"ID_1"}]	2025-11-12 13:17:55.114965
134	LifeAfter	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
135	LifeAfter	serverId	select	Server	f	1	[{"value":"500001","label":"MiskaTown"},{"value":"500002","label":"SandCastle"},{"value":"500003","label":"MouthSwamp"},{"value":"500004","label":"RedwoodTown"},{"value":"500005","label":"Obelisk"},{"value":"500007","label":"ChaosOutpost"},{"value":"500008","label":"IronStrvaluee"},{"value":"510001","label":"FallForest"},{"value":"510002","label":"MountSnow"},{"value":"520001","label":"NancyCity"},{"value":"520002","label":"CharlesTown"},{"value":"520003","label":"SnowHighlands"},{"value":"520004","label":"Santopany"},{"value":"520005","label":"LevinCity"},{"value":"520007","label":"ChaosCity"},{"value":"520008","label":"TwinIslands"},{"value":"520009","label":"HopeWall"},{"value":"500006","label":"NewLand"},{"value":"500009","label":"CrystalthornSea"},{"value":"520006","label":"MileStone"},{"value":"520010","label":"LabyrinthSea"},{"value":"550001","label":"파플래닛"},{"value":"550002","label":"미스카대학"},{"value":"550003","label":"희망의골짜기"},{"value":"550004","label":"다베트설산"},{"value":"550005","label":"가을빛산림"},{"value":"550006","label":"스노우힐"},{"value":"550007","label":"사막의요새"},{"value":"560001","label":"FallForest"},{"value":"560002","label":"HopeValley"},{"value":"560003","label":"SandCastle"},{"value":"560004","label":"MountSnow"},{"value":"560005","label":"St.Rona"},{"value":"560006","label":"Oasis"},{"value":"560007","label":"SilentIsland"},{"value":"560008","label":"ArkCity"},{"value":"730001","label":"EasySurvival"},{"value":"720001","label":"SimpleSurvival"}]	2025-11-12 13:17:55.114965
136	Lovebrush Chronicles	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
137	Lovebrush Chronicles	serverId	select	Server	f	1	[{"value":"Global","label":"Global"}]	2025-11-12 13:17:55.114965
138	MARVEL Duel	gameId	text	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
139	MOB RUSH	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
140	MOB RUSH	serverId	number	Masukkan Zone ID	f	1	\N	2025-11-12 13:17:55.114965
141	NBA INFINITE	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
142	NBA INFINITE	serverId	select	Pilih Server	f	1	[{"value":"Oceania","label":"Oceania"},{"value":"SouthAmerica","label":"SouthAmerica"},{"value":"NA","label":"NA"},{"value":"Asia","label":"Asia"},{"value":"Europe","label":"Europe"}]	2025-11-12 13:17:55.114965
143	OCTOPATH Traveler CotC	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
144	OCTOPATH Traveler CotC	serverId	select	Pilih Server	f	1	[{"value":"-1","label":"Global"}]	2025-11-12 13:17:55.114965
145	Onmyoji Arena	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
146	Path to Nowhere	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
147	Pixel Gun 3D	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
148	Ragnarok Origin	gameId	text	Masukkan Secret Code	f	0	\N	2025-11-12 13:17:55.114965
149	Ragnarok Origin	serverId	select	Pilih Server	f	1	[{"value":"Prontera-(1~3)","label":"Prontera-(1~3)"},{"value":"Prontera-(4~6)","label":"Prontera-(4~6)"},{"value":"Prontera-(7~9)","label":"Prontera-(7~9)"},{"value":"Prontera-10/Izlude-(1~4)","label":"Prontera-10/Izlude-(1~4)"},{"value":"Izlude-(5~8)","label":"Izlude-(5~8)"},{"value":"Izlude-9(-10)/Morroc-(1~4)","label":"Izlude-9(-10)/Morroc-(1~4)"},{"value":"Morroc-(5~10)","label":"Morroc-(5~10)"},{"value":"Geffen-(1~10)/Payon-1","label":"Geffen-(1~10)/Payon-1"},{"value":"Payon-(2~10)","label":"Payon-(2~10)"},{"value":"Poring Island-(1~10)/Orc Village-(1~3)","label":"Poring Island-(1~10)/Orc Village-(1~3)"},{"value":"Orc Village-(4~10)/Shipwreck-1(-2)","label":"Orc Village-(4~10)/Shipwreck-1(-2)"},{"value":"Shipwreck-(3~9)","label":"Shipwreck-(3~9)"},{"value":"Memoria/Awakening/Ant Hell-(1~5)","label":"Memoria/Awakening/Ant Hell-(1~5)"},{"value":"Ant Hell-(7~10)","label":"Ant Hell-(7~10)"},{"value":"Goblin Forest-1(-2)","label":"Goblin Forest-1(-2)"},{"value":"Valentine","label":"Valentine"},{"value":"Goblin Forest-4","label":"Goblin Forest-4"},{"value":"Lasagna","label":"Lasagna"},{"value":"1st-Anniversary","label":"1st-Anniversary"},{"value":"Goblin Forest-7","label":"Goblin Forest-7"},{"value":"For Honor","label":"For Honor"},{"value":"Sakura Vows/Goblin Forest-10/Garden-1","label":"Sakura Vows/Goblin Forest-10/Garden-1"},{"value":"1.5th Anniversary","label":"1.5th Anniversary"},{"value":"Vicland","label":"Vicland"},{"value":"2025","label":"2025"},{"value":"2nd Anniversary","label":"2nd Anniversary"}]	2025-11-12 13:17:55.114965
150	Ragnarok Origin	nickname	text	Nickname	f	2	\N	2025-11-12 13:17:55.114965
151	Ragnarok X Next Generation	gameId	number	Input Role ID	f	0	\N	2025-11-12 13:17:55.114965
152	Ragnarok X Next Generation	serverId	select	Select Server	f	1	[{"value":"2010","label":"Opera Phantom"},{"value":"2011","label":"Wing of Blessing"},{"value":"2012","label":"Royal Instrument"},{"value":"2013","label":"Valhalla"},{"value":"2014","label":"Gungnir"},{"value":"2015","label":"Central Plains"},{"value":"2016","label":"Dark Lord"},{"value":"2017","label":"Clock Tower"},{"value":"2018","label":"Comodo"},{"value":"2019","label":"Rainbow Paradise"},{"value":"2020","label":"Temple of Dawn"},{"value":"2021","label":"Golden Lava"},{"value":"2022","label":"Highland"},{"value":"2023","label":"Demon's Castle"},{"value":"2024","label":"Sealed Island"},{"value":"2025","label":"Sipera"},{"value":"2030","label":"Silent Ship"},{"value":"2031","label":"Golden Route"},{"value":"2032","label":"Sapir"},{"value":"2033","label":"Rose Red"},{"value":"2034","label":"Kingdom of Freedom"},{"value":"2035","label":"Nicola"},{"value":"2040","label":"Crystal Waterfall"},{"value":"2041","label":"Bifrost"},{"value":"2042","label":"Nastia"},{"value":"2043","label":"Strouf Treasury"},{"value":"2044","label":"Green Tranquil Pond"},{"value":"2045","label":"Ingael"},{"value":"2046","label":"Dark Priest"},{"value":"2050","label":"Tome of Glory"},{"value":"2051","label":"Incense Pavilion"},{"value":"2052","label":"Carew"},{"value":"2053","label":"Boulders and Horns"},{"value":"2054","label":"Exquisite Pond"},{"value":"2055","label":"Nemesis"},{"value":"2056","label":"Aldebaran"},{"value":"2057","label":"Honor of Emperium"},{"value":"2058","label":"Frenetic Land"},{"value":"2060","label":"Bright Lotus Pond"},{"value":"2061","label":"Seocho Market"},{"value":"2062","label":"Eudora"},{"value":"2063","label":"Moonlit Temple"},{"value":"2064","label":"Hvalueden Wood Ruins"},{"value":"2065","label":"Dungeon Throne"},{"value":"2066","label":"Dimension Door"},{"value":"2067","label":"Gunslinger's Revenge"},{"value":"2070","label":"Ayothaya"},{"value":"2071","label":"Luzon"},{"value":"2072","label":"Majapahit"},{"value":"2073","label":"Garden City"},{"value":"2074","label":"Manila"},{"value":"2075","label":"Sukhothai"},{"value":"2076","label":"Attack On Poring"},{"value":"2077","label":"Light of Umbala"},{"value":"2080","label":"Tossakan"},{"value":"2081","label":"Badang"},{"value":"2082","label":"Lapulapu"},{"value":"2083","label":"Gatotkaca"},{"value":"2084","label":"Srikandi"},{"value":"2085","label":"Kumpakan"},{"value":"2086","label":"Original Love"},{"value":"2090","label":"Angeling"},{"value":"2091","label":"Deviling"},{"value":"2092","label":"Ghostring"},{"value":"2093","label":"Mastering"},{"value":"2094","label":"Drops"},{"value":"2095","label":"Poporing"},{"value":"2100","label":"Song Tử"},{"value":"2101","label":"Xử Nữ"},{"value":"2102","label":"Bọ Cạp"},{"value":"2103","label":"Nhân Mã"},{"value":"2104","label":"Thiên Bình"},{"value":"2105","label":"Sư Tử"},{"value":"2110","label":"Half Anniversary"},{"value":"2111","label":"Trail of Illusion"},{"value":"2112","label":"Angel Spirit"},{"value":"2113","label":"Wishing Tree"},{"value":"2114","label":"Infinity Axe"},{"value":"2115","label":"Meteor Blessing"},{"value":"2120","label":"Dimension Door"},{"value":"2121","label":"All-Star-Prepare"},{"value":"2122","label":"Daphne"},{"value":"2123","label":"Coral Garden"},{"value":"2124","label":"Mjolnir"},{"value":"2125","label":"Lightning Cloud"},{"value":"2130","label":"Ghastly Cemetery"},{"value":"2131","label":"Hero Association"},{"value":"2132","label":"Monster Association"},{"value":"2133","label":"Taekwon"},{"value":"2134","label":"3rd Anniversary"},{"value":"2135","label":"The Demon Carnival"},{"value":"2136","label":"Einbroch"},{"value":"2137","label":"Lost City"},{"value":"2138","label":"4th Job"},{"value":"2139","label":"Winter Dawn"},{"value":"2140","label":"Abyssal Hole"},{"value":"2141","label":"Ancestral Hall"},{"value":"2142","label":"Paweena"},{"value":"2143","label":"Fallen Maple Forest"},{"value":"2144","label":"Bookshelf Arcade"},{"value":"2145","label":"Rachel"},{"value":"2150","label":"赛事服"},{"value":"2151","label":"Hermit Hut"},{"value":"2152","label":"Gardner"},{"value":"2153","label":"Glass Brooch"},{"value":"2154","label":"Jarnvvalue"},{"value":"2155","label":"Felix"},{"value":"2160","label":"Giant Claw Throne"},{"value":"2161","label":"Laevatain"},{"value":"2162","label":"Ophelia"},{"value":"2163","label":"Fairy Wing"},{"value":"2164","label":"Night Pearl"},{"value":"2165","label":"Tracy"},{"value":"2170","label":"Telekinetic Orb"},{"value":"2171","label":"Mainz"},{"value":"2172","label":"Surtr"},{"value":"2173","label":"Clearwater Pearl"},{"value":"2174","label":"Mandragora"},{"value":"2175","label":"Hollgrehenn"},{"value":"2180","label":"Weinst"},{"value":"2181","label":"Tyrfing"},{"value":"2182","label":"Ahlspiess"},{"value":"2183","label":"Black Iron Medal"},{"value":"2184","label":"Inverse Scale"},{"value":"2185","label":"Villar"},{"value":"2190","label":"Divine Shield"},{"value":"2191","label":"Falken Blitz"},{"value":"2192","label":"Zimmerman"},{"value":"2193","label":"Hurricane Fury"},{"value":"2194","label":"Kronos"},{"value":"2195","label":"Alson"},{"value":"2200","label":"Tome of Eternity"},{"value":"2201","label":"Kalasag"},{"value":"2202","label":"Toad Shadow"},{"value":"2203","label":"Shadow Guard"},{"value":"2204","label":"Gemmed Crown"},{"value":"2205","label":"Balmung"},{"value":"2210","label":"Sphinx Spirit"},{"value":"2211","label":"Ring of Thorns"},{"value":"2212","label":"Luminary"},{"value":"2213","label":"Runic Factory"},{"value":"2214","label":"Scarlet Phantom"},{"value":"2215","label":"Poring Crown"},{"value":"2220","label":"King's Apostle"},{"value":"2221","label":"Royal Blood"},{"value":"2222","label":"Royal Road"},{"value":"2223","label":"Alpha Wolf Gem"},{"value":"2224","label":"Fullers"},{"value":"2225","label":"Oxi"},{"value":"2230","label":"Angel Kiss"},{"value":"2231","label":"Omniscient Angel"},{"value":"2232","label":"Angel Wing"},{"value":"2233","label":"Whispering Demon"},{"value":"2234","label":"Demon Horn"},{"value":"2235","label":"Mindful Jade"},{"value":"2240","label":"Festive Lantern"},{"value":"2241","label":"Blissful Brvaluee"},{"value":"2242","label":"Crystal Tiara"},{"value":"2243","label":"Carousel"},{"value":"2244","label":"Resurrection Night March"},{"value":"2245","label":"Warm Winter"},{"value":"2250","label":"Royal Chivalry"},{"value":"2251","label":"Golden Wings"},{"value":"2252","label":"Gladsheim"},{"value":"2253","label":"Crystal Ball"},{"value":"2254","label":"Promise Carriage"},{"value":"2255","label":"Red Gilded Satin"},{"value":"2260","label":"Moonlit Cave"},{"value":"2261","label":"Deep Sea Deity"},{"value":"2262","label":"Albel"},{"value":"2263","label":"Pooler Garden"},{"value":"2264","label":"Blake"},{"value":"2265","label":"Elvira"},{"value":"2270","label":"Champagne Blue"},{"value":"2271","label":"Underground Fighting Arena"},{"value":"2272","label":"Gold Obsvalueian"},{"value":"2273","label":"Sword of Victory"},{"value":"2274","label":"Arielle"},{"value":"2275","label":"Keyte"},{"value":"2280","label":"Secret Cave"},{"value":"2281","label":"Soul Obelisk"},{"value":"2282","label":"Brock"},{"value":"2283","label":"White Muslin Bow Tie"},{"value":"2284","label":"Fuller"},{"value":"2285","label":"Lonvius"},{"value":"2290","label":"Rising Peaks Forest"},{"value":"2291","label":"Twilight Blade"},{"value":"2292","label":"The Sword of Giant"},{"value":"2293","label":"Rainbow Coral"},{"value":"2294","label":"Hobson"},{"value":"2295","label":"Njord"},{"value":"2300","label":"tmp2300"},{"value":"2301","label":"tmp2301"},{"value":"2302","label":"tmp2302"},{"value":"2303","label":"tmp2303"},{"value":"2304","label":"tmp2304"},{"value":"2305","label":"tmp2305"},{"value":"2310","label":"tmp2310"},{"value":"2311","label":"tmp2311"},{"value":"2312","label":"tmp2312"},{"value":"2313","label":"tmp2313"},{"value":"2314","label":"tmp2314"},{"value":"2315","label":"tmp2315"},{"value":"2320","label":"tmp2320"},{"value":"2321","label":"tmp2321"},{"value":"2322","label":"tmp2322"},{"value":"2323","label":"tmp2323"},{"value":"2324","label":"tmp2324"},{"value":"2325","label":"tmp2325"},{"value":"2330","label":"tmp2330"},{"value":"2331","label":"tmp2331"},{"value":"2332","label":"tmp2332"},{"value":"2333","label":"tmp2333"},{"value":"2334","label":"tmp2334"},{"value":"2335","label":"tmp2335"},{"value":"21310","label":"Verdant Horizon"}]	2025-11-12 13:17:55.114965
153	SEAL M SEA	gameId	text	Masukkan CS Code	f	0	\N	2025-11-12 13:17:55.114965
154	SEAL M SEA	serverId	select	Pilih Server	f	1	[{"value":"Duran","label":"Duran"},{"value":"Arus","label":"Arus"}]	2025-11-12 13:17:55.114965
155	Sausage Man	gameId	text	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
156	Snowbreak Containment Zone	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
157	Snowbreak Containment Zone	serverId	select	Pilih Server	f	1	[{"value":"225","label":"Asia"},{"value":"215","label":"Southeast Asia"},{"value":"235","label":"Americas"},{"value":"245","label":"Europe"}]	2025-11-12 13:17:55.114965
158	Soul Land New World	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
159	Speed Drifters	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
160	State of Survival Zombie War	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
161	Tamashi Rise of Yokai	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
162	Tamashi Rise of Yokai	serverId	select	Pilih Server	f	1	[{"value":"3","label":"AP1-Kojiro"},{"value":"4","label":"AP2-Miyazu"},{"value":"5","label":"AP3-Hamori"},{"value":"6","label":"AP4-Hachiman"},{"value":"7","label":"AP5-Kappa"},{"value":"8","label":"AP6-Sarutahiko"},{"value":"9","label":"AP7-Ohkami"},{"value":"10","label":"AP8-Izanagi"},{"value":"11","label":"AP9-Tenjin"},{"value":"12","label":"AP10-Ekibiogami"},{"value":"13","label":"AP11-Musubi"},{"value":"14","label":"AP12-Samebito"},{"value":"15","label":"AP13-Momotaro"},{"value":"16","label":"AP14-Gaki"},{"value":"17","label":"AP15-Hoderi"},{"value":"18","label":"AP16-Hotei"},{"value":"19","label":"AP17-Kamado"},{"value":"20","label":"AP18-Miroka"},{"value":"21","label":"AP19-Gama"},{"value":"22","label":"AP20-Jikoku"},{"value":"23","label":"AP21-Shojo"},{"value":"24","label":"AP22-Jinushigami"},{"value":"25","label":"AP23-Juichimen"},{"value":"26","label":"AP24-Tengu"},{"value":"27","label":"AP25-Ravalueen"},{"value":"28","label":"AP26-Monju"},{"value":"29","label":"AP27-Akuma"},{"value":"30","label":"AP28-Futen"},{"value":"31","label":"AP29-Kura"},{"value":"32","label":"AP30-Funadama"},{"value":"33","label":"AP31-Kami"},{"value":"34","label":"AP32-Kunitokotachi"},{"value":"35","label":"AP33-Nichiren"},{"value":"36","label":"AP34-Tsuki"},{"value":"37","label":"AP35-Sambo"},{"value":"38","label":"AP36-Inari"},{"value":"39","label":"AP37-Suijin"},{"value":"40","label":"AP38-Shoki"},{"value":"41","label":"AP39-Tsukiyomi"},{"value":"42","label":"AP40-Fukurokuju"},{"value":"43","label":"AP41-Chimatano"},{"value":"44","label":"AP42-Yamato"},{"value":"45","label":"AP43-Shaka"},{"value":"46","label":"AP44-Suitengu"},{"value":"47","label":"AP45-Maitreya"},{"value":"48","label":"AP46-Susano"},{"value":"49","label":"AP47-Heike"},{"value":"50","label":"AP48-Bosatsu"},{"value":"51","label":"AP49-Baku"},{"value":"52","label":"AP50-Nominosukune"},{"value":"53","label":"AP51-Suzuki"},{"value":"54","label":"AP52-Sekiguchi"},{"value":"55","label":"AP53-Noriko"},{"value":"56","label":"AP54-Akamine"},{"value":"57","label":"AP55-Yuriko"},{"value":"58","label":"AP56-Ishinomaki"},{"value":"59","label":"AP57-Shiogama"},{"value":"60","label":"AP58-Kesennuma"},{"value":"61","label":"AP59-Shinoishi"},{"value":"62","label":"AP60-Natori"},{"value":"63","label":"AP61-Takuda"},{"value":"64","label":"AP62-Tagajyo"},{"value":"65","label":"AP63-Iwanuma"},{"value":"66","label":"AP64-Tome"},{"value":"67","label":"AP65-Kurihara"},{"value":"68","label":"AP66-Higashi"},{"value":"69","label":"AP67-Osaki"},{"value":"70","label":"AP68-Onagawa"},{"value":"71","label":"AP69-Chyo"},{"value":"72","label":"AP70-Minami"},{"value":"73","label":"AP71-Yamagata"},{"value":"74","label":"AP72-Fukushima"},{"value":"75","label":"AP73-Aijiwaka"},{"value":"76","label":"AP74-Kooriyama"},{"value":"77","label":"AP75-Iwaki"},{"value":"78","label":"AP76-Shirakawa"},{"value":"79","label":"AP77-Sukagawa"},{"value":"80","label":"AP78-Kitakata"},{"value":"81","label":"AP79-Soma"},{"value":"82","label":"AP80-Nihonmatsu"},{"value":"83","label":"AP81-Tamura"},{"value":"84","label":"AP82-Minamisoma"},{"value":"85","label":"AP83-Date"},{"value":"86","label":"AP84-Motomiya"},{"value":"87","label":"AP85-Date"},{"value":"88","label":"AP86-Ibaraki"},{"value":"89","label":"AP87-Mito"},{"value":"90","label":"AP88-Hitachi"},{"value":"91","label":"AP89-Tsuchiura"},{"value":"92","label":"AP90-Koga"},{"value":"93","label":"AP91-Ishioka"},{"value":"94","label":"AP92-Yuuki"},{"value":"95","label":"AP93-Ryugasaki"},{"value":"96","label":"AP94-Shimotsuma"},{"value":"97","label":"AP95-Jyoso"},{"value":"98","label":"AP96-Hitachiota"},{"value":"99","label":"AP97-Takahagi"},{"value":"100","label":"AP98-Kitaibaraki"},{"value":"101","label":"AP99-Kasama"},{"value":"102","label":"AP100-Torite"},{"value":"103","label":"AP101-Karaa"},{"value":"104","label":"AP102-Seiji"},{"value":"105","label":"AP103-Hiashinsu"},{"value":"106","label":"AP104-Tanpopo"},{"value":"107","label":"AP105-Orientaru"},{"value":"108","label":"AP106-Bara"},{"value":"109","label":"AP107-Botan"},{"value":"110","label":"AP108-Matsurika"},{"value":"113","label":"AP109-Shiroizumi"},{"value":"114","label":"AP110-Hikari"},{"value":"115","label":"AP111-Murasaki"},{"value":"116","label":"AP112-Ranhana"},{"value":"117","label":"AP113-Kusari"},{"value":"118","label":"AP114-Davalueai"},{"value":"119","label":"AP115-Mvalueori"},{"value":"120","label":"AP116-Kaze"},{"value":"121","label":"AP117-Yama"},{"value":"122","label":"AP118-Kiri"},{"value":"123","label":"AP119-Kajime"},{"value":"124","label":"AP120-Syokubutu"},{"value":"125","label":"AP121-Mise"},{"value":"126","label":"AP122-Tatemono"},{"value":"127","label":"AP123-Kaisya"},{"value":"128","label":"AP124-Ginnkou"},{"value":"129","label":"AP125-Kouenn"},{"value":"130","label":"AP126-Gakkou"},{"value":"131","label":"AP127-Michi"},{"value":"132","label":"AP128-Kyousitsu"},{"value":"133","label":"AP129-Basutei"},{"value":"134","label":"AP130-Kumo"},{"value":"135","label":"AP131-Heya"},{"value":"136","label":"AP132-Chikatetsu"},{"value":"137","label":"AP133-Kissatenn"},{"value":"138","label":"AP134-Tosyokann"},{"value":"139","label":"AP135-Eigakann"},{"value":"140","label":"AP136-Kousatenn"},{"value":"141","label":"AP137-Apato"},{"value":"142","label":"AP138-Hoteru"},{"value":"143","label":"AP139-Basyo"},{"value":"144","label":"AP140-Tokoro"},{"value":"145","label":"AP141-Gohann"},{"value":"146","label":"AP142-Koori"},{"value":"147","label":"AP143-Okasi"},{"value":"148","label":"AP144-Ryouri"},{"value":"149","label":"AP145-Sakana"},{"value":"150","label":"AP146-Kudamono"},{"value":"151","label":"AP147-Gyuuniku"},{"value":"152","label":"AP148-Butaniku"},{"value":"153","label":"AP149-Toriniku"},{"value":"154","label":"AP150-Yasai"},{"value":"155","label":"AP151-Tamago"},{"value":"156","label":"AP152-Syouyu"},{"value":"157","label":"AP153-Nomimono"},{"value":"158","label":"AP154-Mizu"},{"value":"159","label":"AP155-Ocha"},{"value":"160","label":"AP156-Koucha"},{"value":"161","label":"AP157-Gyuunyuu"},{"value":"162","label":"AP158-Osake"},{"value":"163","label":"AP159-Biru"},{"value":"164","label":"AP160-Kohi"},{"value":"165","label":"AP161-Fuku"},{"value":"166","label":"AP162-Youfuku"},{"value":"167","label":"AP163-Koto"},{"value":"168","label":"AP164-Syatsu"},{"value":"169","label":"AP165-Seta"},{"value":"170","label":"AP166-Poketto"},{"value":"171","label":"AP167-Botann"},{"value":"172","label":"AP168-Zubonn"},{"value":"173","label":"AP169-Sukato"},{"value":"174","label":"AP170-Kutsu"},{"value":"175","label":"AP171-Honn"},{"value":"176","label":"AP172-Chizu"},{"value":"177","label":"AP173-Jisyo"},{"value":"178","label":"AP174-Tegami"},{"value":"179","label":"AP175-Kitte"},{"value":"180","label":"AP176-Honndana"},{"value":"181","label":"AP177-Ennpitsu"},{"value":"182","label":"AP178-Jyougi"},{"value":"183","label":"AP179-Kesigomu"},{"value":"184","label":"AP180-Noto"},{"value":"185","label":"AP181-Borupenn"},{"value":"186","label":"AP182-Dennwa"},{"value":"187","label":"AP183-Reizouko"},{"value":"188","label":"AP184-Terebi"},{"value":"189","label":"AP185-Bvalueeo"},{"value":"190","label":"AP186-Kamera"},{"value":"191","label":"AP187-Pasokon"},{"value":"192","label":"AP188-Eakonn"},{"value":"193","label":"AP189-Kutsusita"},{"value":"194","label":"AP190-Hvalueari"},{"value":"195","label":"AP191-Migi"},{"value":"196","label":"AP192-Naka"},{"value":"197","label":"AP193-Sita"},{"value":"198","label":"AP194-Usiro"},{"value":"199","label":"AP195-Mae"},{"value":"200","label":"AP196-Tsyatsu"},{"value":"201","label":"AP197-Higasi"},{"value":"202","label":"AP198-Kita"},{"value":"203","label":"AP199-Nisi"},{"value":"204","label":"AP200-Uchi"},{"value":"205","label":"AP201-Takai"},{"value":"206","label":"AP202-Hikui"},{"value":"207","label":"AP203-Atarasii"},{"value":"208","label":"AP204-Omosiroi"},{"value":"209","label":"AP205-Tsumura"},{"value":"210","label":"AP206-Chiisai"},{"value":"211","label":"AP207-Amai"},{"value":"212","label":"AP208-Oisii"},{"value":"213","label":"AP209-Yasasii"},{"value":"214","label":"AP210-Kibisii"},{"value":"215","label":"AP211-Bandot"},{"value":"216","label":"AP212-Akarui"},{"value":"217","label":"AP213-Isogasii"},{"value":"218","label":"AP214-Kawaii"},{"value":"219","label":"AP215-Tanosii"},{"value":"220","label":"AP216-Kirei"},{"value":"221","label":"AP217-Bennri"},{"value":"222","label":"AP218-Yuumei"},{"value":"223","label":"AP219-Sizuka"},{"value":"224","label":"AP220-Nigiyaka"},{"value":"225","label":"AP221-Ayumi"},{"value":"226","label":"AP222-Avaluea"},{"value":"227","label":"AP223-Maki"},{"value":"228","label":"AP224-Syoko"},{"value":"229","label":"AP225-Rina"},{"value":"230","label":"AP226-Aihara"},{"value":"231","label":"AP227-Ryou"},{"value":"232","label":"AP228-Misao"},{"value":"233","label":"AP229-Riyo"},{"value":"234","label":"AP230-Chiharu"},{"value":"235","label":"AP231-Chisa"},{"value":"236","label":"AP232-Fumie"},{"value":"237","label":"AP233-Kaori"},{"value":"238","label":"AP234-Naoko"},{"value":"239","label":"AP235-Shino"},{"value":"240","label":"AP236-Tomomi"},{"value":"241","label":"AP237-Akahori"},{"value":"242","label":"AP238-Akai"},{"value":"243","label":"AP239-Rika"},{"value":"244","label":"AP240-Akasaka"},{"value":"245","label":"AP241-Nanae"},{"value":"246","label":"AP242-Rei"},{"value":"247","label":"AP243-Akimoto"},{"value":"248","label":" AP244-Shinobu"},{"value":"249","label":" AP245-Akino"},{"value":"250","label":" AP246-Shiori"},{"value":"251","label":" AP247-Shiro"},{"value":"252","label":" AP248-Akitsuma"},{"value":"253","label":" AP249-Misa"},{"value":"254","label":" AP250-Sayee"},{"value":"255","label":" AP251-Risa"},{"value":"256","label":"AP252-Yoshiko"},{"value":"257","label":"AP253-Yumiko"},{"value":"258","label":"AP254-Michiru"},{"value":"259","label":" AP255-Shiana"},{"value":"260","label":" AP256-Michiko"},{"value":"261","label":"AP257-Chiaki "},{"value":"262","label":" AP258-Fumina"},{"value":"263","label":" AP259-Yuuka"},{"value":"264","label":" AP260-Yoshimi"},{"value":"265","label":" AP261-Sonoko"},{"value":"266","label":" AP262-Akira"},{"value":"267","label":" AP263-Sayaka"},{"value":"268","label":" AP264-Atsuko"},{"value":"269","label":" AP265-Ikuko"},{"value":"270","label":" AP266-Urara"},{"value":"271","label":"AP267-Emiko"},{"value":"272","label":" AP268-Erika"},{"value":"273","label":" AP269-Otome"},{"value":"274","label":" AP270-Kaoru"},{"value":"275","label":" AP271-Kaziki"},{"value":"276","label":" AP272-Otoha"},{"value":"277","label":" AP273-Kahori"},{"value":"278","label":" AP274-Kieko"},{"value":"279","label":" AP275-Saika"},{"value":"280","label":" AP276-Seiko"},{"value":"281","label":" AP277-Tatsuko"},{"value":"282","label":" AP278-Serina"},{"value":"283","label":" AP279-Chihaya"},{"value":"284","label":" AP280-Sumie"},{"value":"285","label":" AP281-Momoko"},{"value":"286","label":" AP282-Mina"},{"value":"287","label":" AP283-Sara"},{"value":"288","label":" AP284-Wakana"},{"value":"289","label":" AP285-Reina"},{"value":"290","label":" AP286-Yuzu"},{"value":"291","label":"AP287-Misuzu"},{"value":"294","label":" AP288-Hirono"},{"value":"295","label":" AP289-Norie"},{"value":"296","label":" AP290-Anji"},{"value":"297","label":" AP291-Itsumi"},{"value":"298","label":" AP292-Eiko"},{"value":"299","label":" AP293-Kiku"},{"value":"300","label":" AP294-Saeko"},{"value":"301","label":" AP295-Jyunna"},{"value":"302","label":" AP296-Senna"},{"value":"303","label":" AP297-Chvalueuru"},{"value":"304","label":" AP298-Amika"},{"value":"305","label":" AP299-Maaya"},{"value":"306","label":" AP300-Mana"},{"value":"313","label":"AP301-Mino"},{"value":"314","label":" AP302-Momo"},{"value":"315","label":" AP303-Sushi"},{"value":"316","label":" AP304-Yoshi"},{"value":"317","label":" AP305-Haruki"},{"value":"318","label":" AP306-Fuwa"},{"value":"319","label":" AP307-Yuki"},{"value":"320","label":" AP308-Tadeo"},{"value":"321","label":" AP309-Fukuku"},{"value":"322","label":" AP310-Kumori"},{"value":"323","label":"AP311-Shin"},{"value":"324","label":"AP312-Kaiko"},{"value":"325","label":"AP313-Hakaku"},{"value":"326","label":"AP314-Tofu"},{"value":"327","label":" AP315-Hai"},{"value":"328","label":" AP316-Kage"},{"value":"329","label":" AP317-Shinju"},{"value":"330","label":" AP318-Kazen"},{"value":"331","label":" AP319-Daiko"},{"value":"332","label":" AP320-Maya"},{"value":"333","label":"AP321-Fuji"},{"value":"334","label":" AP322-Doki"},{"value":"335","label":" AP323-Chiyo"},{"value":"336","label":" AP324-Hanabi"},{"value":"337","label":"AP325-Kiyo"},{"value":"338","label":"AP326-Togumi"},{"value":"339","label":"AP327-Tatsuki"},{"value":"340","label":"AP328-Ichiro"},{"value":"341","label":" AP329-Shohei"},{"value":"342","label":" AP330-Ryuu"},{"value":"343","label":" AP331-Tomaz"},{"value":"344","label":" AP332-Rinaki"},{"value":"345","label":" AP333-Aito"},{"value":"346","label":" AP334-Morei"},{"value":"347","label":" AP335-Eren"},{"value":"348","label":" AP336-Sasuke"},{"value":"349","label":" AP337-Taiyou"},{"value":"350","label":" AP338-Mushi"},{"value":"351","label":" AP339-Ichika"},{"value":"352","label":" AP340-Nen"},{"value":"353","label":" AP341-Gon"},{"value":"354","label":" AP342-Leo"},{"value":"355","label":" AP343-Soya"},{"value":"356","label":" AP344-Neir"},{"value":"357","label":" AP345-Yui"},{"value":"358","label":" AP346-Rem"},{"value":"359","label":" AP347-Suba"},{"value":"360","label":" AP348-Baru"},{"value":"361","label":" AP349-Koeri"},{"value":"362","label":" AP350-Hanaba"},{"value":"363","label":" AP351-Yunaa"},{"value":"364","label":" AP352-Sob"},{"value":"365","label":" AP353-Haru"},{"value":"366","label":" AP354-Hime"},{"value":"367","label":" AP355-Koko"},{"value":"368","label":" AP356-Mei"},{"value":"369","label":" AP357-Sora"},{"value":"370","label":" AP358-Tora"},{"value":"371","label":" AP359-Akio"},{"value":"372","label":" AP360-Eimi"},{"value":"373","label":" AP361-Kaiya"},{"value":"374","label":" AP362-Katsumi"},{"value":"375","label":" AP363-Aiko"},{"value":"376","label":" AP364-Yasuo"},{"value":"377","label":" AP365-Suki"},{"value":"378","label":" AP366-Daikon"},{"value":"379","label":" AP367-Isao"},{"value":"380","label":" AP368-Miso"},{"value":"381","label":" AP369-Ramen"},{"value":"382","label":" AP370-Ryugi"},{"value":"383","label":" AP371-Kitaro"},{"value":"384","label":" AP372-Ao"},{"value":"385","label":" AP373-Aka"},{"value":"386","label":" AP374-Kiiro"},{"value":"387","label":" AP375-Chairo"},{"value":"388","label":" AP376-Soba"},{"value":"389","label":" AP377-Unagi"},{"value":"390","label":" AP378-Kuro"},{"value":"391","label":" AP379-Nyoko"},{"value":"392","label":" AP380-Popo"},{"value":"393","label":" AP381-Kameko"},{"value":"394","label":" AP382-Oren"},{"value":"395","label":" AP383-Kaijin"},{"value":"396","label":" AP384-Chobi"},{"value":"397","label":"AP385-Meizu"},{"value":"398","label":" AP386-Gumori"},{"value":"399","label":" AP387-Maru"},{"value":"400","label":" AP388-Mikan"},{"value":"401","label":" AP389-Naomi"},{"value":"402","label":" AP390-Ishvaluea"},{"value":"403","label":" AP391-Byaku"},{"value":"404","label":" AP392-Sakura"},{"value":"405","label":" AP393-Zaki"},{"value":"406","label":" AP394-Giniro"},{"value":"407","label":" AP395-Ren"},{"value":"408","label":" AP396-Suzu"},{"value":"409","label":" AP397-Yoko"},{"value":"410","label":" AP398-Tomori"},{"value":"411","label":" AP399-Arata"},{"value":"412","label":" AP400-Kaede"},{"value":"413","label":"AP401-Aramachi"},{"value":"414","label":" AP402-Mikana"},{"value":"415","label":" AP403-Kamikoube"},{"value":"416","label":" AP404-Sakanio"},{"value":"417","label":" AP405-Yumika"},{"value":"418","label":" AP406-Tsurugou"},{"value":"419","label":" AP407-Shouya"},{"value":"420","label":" AP408-Miyaki"},{"value":"421","label":" AP409-Sasasei"},{"value":"422","label":" AP410-Izayoi"},{"value":"423","label":" AP411-Yataka"},{"value":"424","label":" AP412-Oyazu"},{"value":"425","label":" AP413-Tenki"},{"value":"426","label":" AP414-Ranto"},{"value":"427","label":" AP415-Kitoba"},{"value":"428","label":" AP416-Yokanobu"},{"value":"429","label":" AP417-Nonose"},{"value":"430","label":" AP418-Kumata"},{"value":"431","label":" AP419-Nanaki"},{"value":"432","label":"AP420-Hanoda"},{"value":"433","label":"AP421-Hirutarou"},{"value":"434","label":"AP422-Yatayama"},{"value":"435","label":"AP423-Hosome"},{"value":"436","label":"AP424-Taihara"},{"value":"437","label":" AP425-Hinauchi"},{"value":"438","label":" AP426-Renki"},{"value":"439","label":" AP427-Sotohebo"},{"value":"440","label":" AP428-Heimura"},{"value":"441","label":" AP429-Kosuji"},{"value":"442","label":" AP430-Takibata"},{"value":"443","label":" AP431-Sawagui"},{"value":"444","label":" AP432-Kensei"},{"value":"445","label":" AP433-Isashi"},{"value":"446","label":" AP434-Uchiobo"},{"value":"447","label":" AP435-Fusayuki"},{"value":"448","label":"AP436-Shatori"},{"value":"449","label":" AP437-Nobumi"},{"value":"450","label":" AP438-Hijino"},{"value":"451","label":" AP439-Hiroguchi"},{"value":"452","label":" AP440-Okazue"},{"value":"453","label":" AP441-Kurobo"},{"value":"454","label":" AP442-Reika"},{"value":"455","label":" AP443-Iwatora"},{"value":"456","label":" AP444-Shikou"},{"value":"457","label":" AP445-Hiiro"},{"value":"458","label":" AP446-Makubo"},{"value":"459","label":" AP447-Jinohara"},{"value":"460","label":" AP448-Togihira"},{"value":"461","label":"AP449-Yarai"},{"value":"462","label":" AP450-Mena"},{"value":"463","label":" AP451-Kiguri"},{"value":"464","label":" AP452-Kinowaki"},{"value":"465","label":" AP453-Nagino"},{"value":"466","label":" AP454-Kuchitani"},{"value":"467","label":" AP455-Masyu"},{"value":"468","label":" AP456-Eritachi"},{"value":"469","label":" AP457-Shigeri"},{"value":"470","label":" AP458-Owada"},{"value":"471","label":" AP459-Kohana"},{"value":"472","label":" AP460-Ato"},{"value":"473","label":" AP461-Watanobu"},{"value":"474","label":" AP462-Motoyo"},{"value":"475","label":" AP463-Sanoe"},{"value":"476","label":" AP464-Inomi"},{"value":"477","label":" AP465-Koki"},{"value":"478","label":" AP466-Ondai"},{"value":"479","label":" AP467-Yoi"},{"value":"480","label":" AP468-Yatsui"},{"value":"481","label":"AP469-Akizuki"},{"value":"482","label":" AP470-Sawayo"},{"value":"483","label":"AP471-Yuasa"},{"value":"484","label":" AP472-Riumi"},{"value":"485","label":" AP473-Tsuteto"},{"value":"486","label":" AP474-Messhi"},{"value":"487","label":" AP475-Ryoukai"},{"value":"488","label":" AP476-Maia"},{"value":"489","label":" AP477-Inagaki"},{"value":"490","label":" AP478-Sendou"},{"value":"491","label":" AP479-Nakawake"},{"value":"492","label":"AP480-Houna"},{"value":"493","label":" AP481-Chiki"},{"value":"494","label":" AP482-Edani"},{"value":"495","label":" AP483-Fugono"},{"value":"496","label":" AP484-Jurian"},{"value":"497","label":" AP485-Hiyori"},{"value":"498","label":" AP486-Agechi"},{"value":"499","label":" AP487-Tamate"},{"value":"500","label":" AP488-Ikuishi"},{"value":"501","label":" AP489-Ayasaka"},{"value":"502","label":" AP490-Kenshi"},{"value":"503","label":" AP491-Onshou"},{"value":"504","label":" AP492-Makasu"},{"value":"505","label":" AP493-Kitanari"},{"value":"506","label":" AP494-Masuo"},{"value":"507","label":" AP495-Douhata"},{"value":"508","label":" AP496-Okinagi"},{"value":"509","label":" AP497-Tabasa"},{"value":"200003","label":"NA1-Kisaragi"},{"value":"200004","label":"NA2-Yabune"},{"value":"200005","label":"NA3-Sengen"},{"value":"200006","label":"NA4-Raiju"},{"value":"200007","label":"NA5-Fudo"},{"value":"200008","label":"NA6-Sukuna"},{"value":"200009","label":"NA7-Shichi"},{"value":"200010","label":"NA8-Amatsu"},{"value":"200011","label":"NA9-Mikaboshi"},{"value":"200012","label":"NA10-Takami"},{"value":"200013","label":"NA11-Konsesei"},{"value":"200014","label":"NA12-Bimbogami"},{"value":"200015","label":"NA13-Ohonamochi"},{"value":"200016","label":"NA14-Binzuru"},{"value":"200017","label":"NA15-Kanayama"},{"value":"200018","label":"NA16-Oanomochi"},{"value":"200019","label":"NA17-Owatatsumi"},{"value":"200020","label":"NA18-Shoko"},{"value":"200021","label":"NA19-Aizen"},{"value":"200022","label":"NA20-Bishamon"},{"value":"200023","label":"NA21-Daibosatsu"},{"value":"200024","label":"NA22-Kenro"},{"value":"200025","label":"NA23-Dainichi"},{"value":"200026","label":"NA24-Jurojin"},{"value":"200027","label":"NA25-Tatsuta"},{"value":"200028","label":"NA26-Imazuma"},{"value":"200029","label":"NA27-Kishimo"},{"value":"200030","label":"NA28-Usodori"},{"value":"200031","label":"NA29-Uzume"},{"value":"200032","label":"NA30-Kudokuten"},{"value":"200033","label":"NA31-Benzaiten"},{"value":"200034","label":"NA32-Hannya"},{"value":"200035","label":"NA33-Fuji"},{"value":"200036","label":"NA34-Kannon"},{"value":"200037","label":"NA35-Ukemochi"},{"value":"200038","label":"NA36-Haniyasu"},{"value":"200039","label":"NA37-Kaminari"},{"value":"200040","label":"NA38-Aino"},{"value":"200041","label":"NA39-Amaterasu"},{"value":"200042","label":"NA40-Sangen"},{"value":"200043","label":"NA41-Akibimi"},{"value":"200044","label":"NA42-Hisame"},{"value":"200045","label":"NA43-Kukurihime"},{"value":"200046","label":"NA44-Izanami"},{"value":"200047","label":"NA45-Kojin"},{"value":"200048","label":"NA46-Otohime"},{"value":"200049","label":"NA47-Kanzeon"},{"value":"200050","label":"NA48-Marici"},{"value":"200051","label":"NA49-Karitei"},{"value":"200052","label":"NA50-Akaru"},{"value":"200053","label":"NA51-Masuyo"},{"value":"200054","label":"NA52-Atsuko"},{"value":"200055","label":"NA53-Kurihara"},{"value":"200056","label":"NA54-Kumagai"},{"value":"200058","label":"NA55-Shigeko"},{"value":"200059","label":"NA56-Shimane"},{"value":"200060","label":"NA57-Matsue"},{"value":"200061","label":"NA58-Okayama"},{"value":"200062","label":"NA59-Hiroshima"},{"value":"200063","label":"NA60-Yamaguchi"},{"value":"200064","label":"NA61-Shikoku"},{"value":"200065","label":"NA62-Tokushima"},{"value":"200066","label":"NA63-Takamatsu"},{"value":"200067","label":"NA64-Kagawa"},{"value":"200068","label":"NA65-Ehime"},{"value":"200069","label":"NA66-Matsuyama"},{"value":"200070","label":"NA67-Kochi"},{"value":"200071","label":"NA68-Kyushu"},{"value":"200072","label":"NA69-Fukuoka"},{"value":"200073","label":"NA70-Saga"},{"value":"200074","label":"NA71-Nagasaki"},{"value":"200075","label":"NA72-Kumamoto"},{"value":"200076","label":"NA73-Oita"},{"value":"200077","label":"NA74-Miyazaki"},{"value":"200078","label":"NA75-Kagoshima"},{"value":"200079","label":"NA76-Naha"},{"value":"200080","label":"NA77-Okinawa"},{"value":"200081","label":"NA78-Cuppo"},{"value":"200082","label":"NA79-Hyakkiya"},{"value":"200083","label":"NA80-Yaiba"},{"value":"200084","label":"NA81-Kimetsu"},{"value":"200085","label":"NA82-Guren"},{"value":"200086","label":"NA83-Abei"},{"value":"200087","label":"NA84-Abigo"},{"value":"200088","label":"NA85-Abumiya"},{"value":"200089","label":"NA86-Aburai"},{"value":"200090","label":"NA87-Adachi"},{"value":"200091","label":"NA88-Adegawa"},{"value":"200092","label":"NA89-Aeba"},{"value":"200093","label":"NA90-Inukai"},{"value":"200094","label":"NA91-Afuso"},{"value":"200095","label":"NA92-Agata"},{"value":"200096","label":"NA93-Takata"},{"value":"200097","label":"NA94-Ageishi"},{"value":"200098","label":"NA95-Agemaki"},{"value":"200099","label":"NA96-Bayashi"},{"value":"200100","label":"NA97-Agune"},{"value":"200101","label":"NA98-Aiyama"},{"value":"200102","label":"NA99-Sanriku"},{"value":"200103","label":"NA100-Aizu"},{"value":"200104","label":"NA101-Tsuyoi"},{"value":"200105","label":" NA102-Karui"},{"value":"200106","label":" NA103-Omoi"},{"value":"200107","label":" NA104-Semai"},{"value":"200108","label":" NA105-Hiroi"},{"value":"200109","label":" NA106-Hayai"},{"value":"200110","label":" NA107-Osoi"},{"value":"200111","label":" NA108-Mijikai"},{"value":"200112","label":" NA109-Nagai"},{"value":"200113","label":" NA110-Akiyama"},{"value":"200114","label":"NA111-Kanon"},{"value":"200115","label":" NA112-Amamiya"},{"value":"200116","label":" NA113-Akane"},{"value":"200117","label":" NA114-Anazawa"},{"value":"200118","label":" NA115-Noriko"},{"value":"200120","label":" NA116-Andou"},{"value":"200121","label":" NA117-Nozomi"},{"value":"200122","label":" NA118-Hiroko"},{"value":"200123","label":" NA119-Anzai"},{"value":"200124","label":" NA120-Kumi"},{"value":"200125","label":" NA121-Aoi"},{"value":"200127","label":" NA122-Minori"},{"value":"200128","label":" NA123-Aoki"},{"value":"200129","label":" NA124-Kotomi"},{"value":"200130","label":"NA125-Mio"},{"value":"200131","label":" NA126-Sawako"},{"value":"200132","label":" NA127-Takako"},{"value":"200133","label":" NA128-Yuko"},{"value":"200135","label":"NA129-Marina"},{"value":"200136","label":" NA130-Aoshi"},{"value":"200137","label":" NA131-Aoyama"},{"value":"200138","label":" NA132-Natsumi"},{"value":"200139","label":" NA133-Arai"},{"value":"200140","label":" NA134-Mieko"},{"value":"200141","label":" NA135-Arisawa"},{"value":"200142","label":" NA136-Keito"},{"value":"200143","label":" NA137-Asada"},{"value":"200144","label":" NA138-Mako"},{"value":"200145","label":" NA139-Naomi"},{"value":"200146","label":" NA140-Junko"},{"value":"200147","label":" NA141-Asahina"},{"value":"200148","label":" NA142-Mineko"},{"value":"200149","label":" NA143-Mari"},{"value":"200150","label":" NA144-Asai"},{"value":"200151","label":" NA145-Asakawa"},{"value":"200152","label":" NA146-Chihiro"},{"value":"200153","label":" NA147-Asabuki"},{"value":"200154","label":" NA148-Asakura"},{"value":"200155","label":" NA149-Hitomi"},{"value":"200156","label":" NA150-Aloh"},{"value":"200157","label":"NA151-Soui"},{"value":"200158","label":" NA152-Chirou"},{"value":"200159","label":" NA153-Soushi"},{"value":"200160","label":" NA154-Souta"},{"value":"200161","label":" NA155-Naoya"},{"value":"200162","label":" NA156-Haruki"},{"value":"200163","label":" NA157-Mizuki"},{"value":"200164","label":" NA158-Sora"},{"value":"200165","label":" NA159-Naoki"},{"value":"200166","label":" NA160-Obana"},{"value":"300003","label":"EU1-Tsuyemon"},{"value":"300004","label":"EU2-Marisha"},{"value":"300005","label":"EU3-Kishijoten"},{"value":"300006","label":"EU4-Kumari"},{"value":"300007","label":"EU5-Minamoto"},{"value":"300008","label":"EU6-Gorou"},{"value":"300009","label":"EU7-Higashi"},{"value":"300010","label":"EU8-Hiroyuki"},{"value":"300011","label":"EU9-Aoki"},{"value":"300012","label":"EU10-Masumi"},{"value":"300013","label":"EU11-Sakiko"},{"value":"300014","label":"EU12-Nishihara"},{"value":"300015","label":"EU13-Kazuhiko"},{"value":"300016","label":"EU14-Yoichi"},{"value":"300017","label":"EU15-Nakamoto"},{"value":"300018","label":"EU16-Hvalueeki"},{"value":"300019","label":"EU17-Saiki"},{"value":"300020","label":"EU18-Nomura"},{"value":"300021","label":"EU19-Yasuhiro"},{"value":"300022","label":"EU20-Tokuda"},{"value":"300023","label":"EU21-Hvalueeo"},{"value":"300024","label":"EU22-Osamu"},{"value":"300025","label":"EU23-Takeuchi"},{"value":"300026","label":"EU24-Takenaka"},{"value":"300027","label":"EU25-Higuchi"},{"value":"300028","label":"EU26-Harada"},{"value":"300029","label":"EU27-Yuudai"},{"value":"300030","label":"EU28-Ohara"},{"value":"300031","label":"EU29-Toshiaki"},{"value":"300032","label":"EU30-Nakai"},{"value":"300033","label":"EU31-Matsuo"},{"value":"300034","label":"EU32-Akihiro"},{"value":"300035","label":"EU33-Katsuo"},{"value":"300036","label":"EU34-Masaki"},{"value":"300037","label":"EU35-Madoka"},{"value":"300038","label":"EU36-Kajiwara"},{"value":"300039","label":"EU37-Hajime"},{"value":"300040","label":"EU38-Murayama"},{"value":"300041","label":"EU39-Kohaku"},{"value":"300042","label":"EU40-Tsuneo"},{"value":"300043","label":"EU41-Yonamine"},{"value":"300044","label":"EU42-Michio"},{"value":"300045","label":"EU43-Horiuchi"},{"value":"300046","label":"EU44-Amaya"},{"value":"300047","label":"EU45-Satoru"},{"value":"300048","label":"EU46-Akiyama"},{"value":"300049","label":"EU47-Ishii"},{"value":"300050","label":"EU48-Mayeda"},{"value":"300051","label":"EU49-Kenshin"},{"value":"300052","label":"EU50-Kanai"},{"value":"300053","label":"EU51-Shimada"},{"value":"300054","label":"EU52-Hatanaka"},{"value":"300055","label":"EU53-Watanabe"},{"value":"300056","label":"EU54-Inari"},{"value":"300057","label":"EU55-Suzusii"},{"value":"300058","label":"EU56-Chikai"},{"value":"300059","label":"EU57-Tooi"},{"value":"300060","label":"EU58-Kimono"},{"value":"300061","label":"EU59-Yukata"},{"value":"300062","label":"EU60-Matsu"},{"value":"300063","label":"EU61-Shima"},{"value":"300064","label":"EU62-Doji"},{"value":"300065","label":"EU63-Yowai"},{"value":"300066","label":"EU64-Soto"},{"value":"300067","label":"EU65-Tonari"},{"value":"300068","label":" EU66-Yoko"},{"value":"300069","label":" EU67-Asobu"},{"value":"300070","label":" EU68-Aruku"},{"value":"300071","label":" EU69-Utau"},{"value":"300072","label":" EU70-Oyogu"},{"value":"300073","label":" EU71-Kaku"},{"value":"300074","label":" EU72-Osieru"},{"value":"300075","label":" EU73-Kaeru"},{"value":"300076","label":" EU74-Sumu"},{"value":"300077","label":" EU75-Kotaeru"},{"value":"300078","label":" EU76-Suwaru"},{"value":"300079","label":" EU77-Komaru"},{"value":"300080","label":" EU78-Tatsu"},{"value":"300081","label":" EU79-Tsukuru"},{"value":"300082","label":" EU80-Owaru"},{"value":"300083","label":" EU81-Taberu"},{"value":"300084","label":" EU82-Tsuku"},{"value":"300085","label":" EU83-Noru"},{"value":"300086","label":" EU84-Tsukau"},{"value":"300087","label":" EU85-Naku"},{"value":"300088","label":"EU86-Nomu"},{"value":"300089","label":" EU87-Tobu"},{"value":"300090","label":" EU88-Neru"},{"value":"300091","label":" EU89-Chigau"},{"value":"300092","label":" EU90-Narabu"},{"value":"300093","label":" EU91-Hairu"},{"value":"300094","label":" EU92-Hajimaru"},{"value":"300095","label":" EU93-Furu"},{"value":"300096","label":" EU94-Miru"},{"value":"300097","label":" EU95-Yomu"},{"value":"300098","label":" EU96-Hasiru"},{"value":"300099","label":" EU97-Samui"},{"value":"300100","label":" EU98-Tsumetai"},{"value":"300101","label":" EU99-Atsui"},{"value":"300102","label":" EU100-Atatakai"},{"value":"300103","label":"EU101-Tsiyuki"},{"value":"300104","label":" EU102-Uyuki"},{"value":"300105","label":" EU103-Suzu"},{"value":"300106","label":" EU104-Yukina"},{"value":"300107","label":" EU105-Suzumi"},{"value":"300108","label":" EU106-Oriyuki"},{"value":"300109","label":" EU107-Amuro"},{"value":"300110","label":" EU108-Shimitsu"},{"value":"300111","label":" EU109-Chinen"},{"value":"300112","label":" EU110-Hayashi"},{"value":"300113","label":" EU111-Kinomoto"},{"value":"300114","label":" EU112-Hasegawa"},{"value":"300115","label":" EU113-Koshimizu"},{"value":"300116","label":" EU114-Shiraishi"},{"value":"300117","label":" EU115-Somezaki"},{"value":"300118","label":" EU116-Moni"},{"value":"300119","label":" EU117-Hiko"},{"value":"300120","label":" EU118-Miki"},{"value":"300121","label":" EU119-Yuka"},{"value":"300122","label":" EU120-Rie"},{"value":"300123","label":" EU121-Ryoko"},{"value":"300124","label":" EU122-Juri"},{"value":"300125","label":" EU123-Ruumika"},{"value":"300126","label":" EU124-Horiuchi"},{"value":"300127","label":"  EU125-Mami"}]	2025-11-12 13:17:55.114965
163	The Ants Underground Kingdom	gameId	number	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
164	Tom and Jerry Chase	gameId	text	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
165	Tom and Jerry Chase	serverId	select	Select Server	f	1	[{"value":"10001","label":"Asia Server"}]	2025-11-12 13:17:55.114965
166	Tower Of Fantasy	gameId	text	Masukkan User ID	f	0	\N	2025-11-12 13:17:55.114965
167	Tower Of Fantasy	serverId	select	Pilih Server	f	1	[{"value":"Asia Pacific-Eden","label":"Asia Pacific-Eden"},{"value":"Asia Pacific-Fate","label":"Asia Pacific-Fate"},{"value":"Asia Pacific-Nova","label":"Asia Pacific-Nova"},{"value":"Asia Pacific-Ruby","label":"Asia Pacific-Ruby"},{"value":"Asia Pacific-Babel","label":"Asia Pacific-Babel"},{"value":"Asia Pacific-Gomap","label":"Asia Pacific-Gomap"},{"value":"Asia Pacific-Pluto","label":"Asia Pacific-Pluto"},{"value":"Asia Pacific-Sushi","label":"Asia Pacific-Sushi"},{"value":"Asia Pacific-Venus","label":"Asia Pacific-Venus"},{"value":"Asia Pacific-Galaxy","label":"Asia Pacific-Galaxy"},{"value":"Asia Pacific-Memory","label":"Asia Pacific-Memory"},{"value":"Asia Pacific-Oxygen","label":"Asia Pacific-Oxygen"},{"value":"Asia Pacific-Sakura","label":"Asia Pacific-Sakura"},{"value":"Asia Pacific-Seeker","label":"Asia Pacific-Seeker"},{"value":"Asia Pacific-Shinya","label":"Asia Pacific-Shinya"},{"value":"Asia Pacific-Stella","label":"Asia Pacific-Stella"},{"value":"Asia Pacific-Uranus","label":"Asia Pacific-Uranus"},{"value":"Asia Pacific-Utopia","label":"Asia Pacific-Utopia"},{"value":"Asia Pacific-Jupiter","label":"Asia Pacific-Jupiter"},{"value":"Asia Pacific-Sweetie","label":"Asia Pacific-Sweetie"},{"value":"Asia Pacific-Atlantis","label":"Asia Pacific-Atlantis"},{"value":"Asia Pacific-Daybreak","label":"Asia Pacific-Daybreak"},{"value":"Asia Pacific-Takoyaki","label":"Asia Pacific-Takoyaki"},{"value":"Asia Pacific-Adventure","label":"Asia Pacific-Adventure"},{"value":"Asia Pacific-Yggdrasil","label":"Asia Pacific-Yggdrasil"},{"value":"Asia Pacific-Cocoaiteruyo","label":"Asia Pacific-Cocoaiteruyo"},{"value":"Asia Pacific-Food fighter","label":"Asia Pacific-Food fighter"},{"value":"Asia Pacific-Mars","label":"Asia Pacific-Mars"},{"value":"Asia Pacific-Vega","label":"Asia Pacific-Vega"},{"value":"Asia Pacific-Neptune","label":"Asia Pacific-Neptune"},{"value":"Asia Pacific-Tenpura","label":"Asia Pacific-Tenpura"},{"value":"Asia Pacific-Moon","label":"Asia Pacific-Moon"},{"value":"Asia Pacific-Mihashira","label":"Asia Pacific-Mihashira"},{"value":"Asia Pacific-Cocokonderu","label":"Asia Pacific-Cocokonderu"},{"value":"Europe-Aimanium","label":"Europe-Aimanium"},{"value":"Europe-Alintheus","label":"Europe-Alintheus"},{"value":"Europe-Andoes","label":"Europe-Andoes"},{"value":"Europe-Anomora","label":"Europe-Anomora"},{"value":"Europe-Astora","label":"Europe-Astora"},{"value":"Europe-Valstamm","label":"Europe-Valstamm"},{"value":"Europe-Blumous","label":"Europe-Blumous"},{"value":"Europe-Celestialrise","label":"Europe-Celestialrise"},{"value":"Europe-Cosmos","label":"Europe-Cosmos"},{"value":"Europe-Dyrnwyn","label":"Europe-Dyrnwyn"},{"value":"Europe-Elypium","label":"Europe-Elypium"},{"value":"Europe-Excalibur","label":"Europe-Excalibur"},{"value":"Europe-Espoir IV","label":"Europe-Espoir IV"},{"value":"Europe-Estrela","label":"Europe-Estrela"},{"value":"Europe-Ether","label":"Europe-Ether"},{"value":"Europe-Ex Nihilor","label":"Europe-Ex Nihilor"},{"value":"Europe-Futuria","label":"Europe-Futuria"},{"value":"Europe-Hephaestus","label":"Europe-Hephaestus"},{"value":"Europe-Midgard","label":"Europe-Midgard"},{"value":"Europe-Iter","label":"Europe-Iter"},{"value":"Europe-Kuura","label":"Europe-Kuura"},{"value":"Europe-Lycoris","label":"Europe-Lycoris"},{"value":"Europe-Lyramiel","label":"Europe-Lyramiel"},{"value":"Europe-Magenta","label":"Europe-Magenta"},{"value":"Europe-Magia Przygoda Aida","label":"Europe-Magia Przygoda Aida"},{"value":"Europe-Olivine","label":"Europe-Olivine"},{"value":"Europe-Omnium Prime","label":"Europe-Omnium Prime"},{"value":"Europe-Turmus","label":"Europe-Turmus"},{"value":"Europe-Transport Hub","label":"Europe-Transport Hub"},{"value":"Europe-The Lumina","label":"Europe-The Lumina"},{"value":"Europe-Seaforth Dock","label":"Europe-Seaforth Dock"},{"value":"Europe-Silvercoast Lab","label":"Europe-Silvercoast Lab"},{"value":"Europe-Karst Cave","label":"Europe-Karst Cave"},{"value":"North America-The Glades","label":"North America-The Glades"},{"value":"North America-Nightfall","label":"North America-Nightfall"},{"value":"North America-Frontier","label":"North America-Frontier"},{"value":"North America-Libera","label":"North America-Libera"},{"value":"North America-Solaris","label":"North America-Solaris"},{"value":"North America-Freedom-Oasis","label":"North America-Freedom-Oasis"},{"value":"North America-Oasis","label":"North America-Oasis"},{"value":"North America-The worlds between","label":"North America-The worlds between"},{"value":"North America-Radiant","label":"North America-Radiant"},{"value":"North America-Tempest","label":"North America-Tempest"},{"value":"North America-New Era","label":"North America-New Era"},{"value":"North America-Observer","label":"North America-Observer"},{"value":"North America-Lunalite","label":"North America-Lunalite"},{"value":"North America-Starlight","label":"North America-Starlight"},{"value":"North America-Myriad","label":"North America-Myriad"},{"value":"North America-Lighthouse","label":"North America-Lighthouse"},{"value":"North America-Oumuamua","label":"North America-Oumuamua"},{"value":"North America-Eternium Phantasy","label":"North America-Eternium Phantasy"},{"value":"North America-Sol-III","label":"North America-Sol-III"},{"value":"North America-Silver Bridge","label":"North America-Silver Bridge"},{"value":"North America-Azure Plane","label":"North America-Azure Plane"},{"value":"North America-Nirvana","label":"North America-Nirvana"},{"value":"North America-Ozera","label":"North America-Ozera"},{"value":"North America-Polar","label":"North America-Polar"},{"value":"North America-Oasis","label":"North America-Oasis"},{"value":"South America-Orion","label":"South America-Orion"},{"value":"South America-Luna Azul","label":"South America-Luna Azul"},{"value":"South America-Tiamat","label":"South America-Tiamat"},{"value":"South America-Hope","label":"South America-Hope"},{"value":"South America-Tanzanite","label":"South America-Tanzanite"},{"value":"South America-Calodesma Seven","label":"South America-Calodesma Seven"},{"value":"South America-Antlia","label":"South America-Antlia"},{"value":"South America-Pegasus","label":"South America-Pegasus"},{"value":"South America-Phoenix","label":"South America-Phoenix"},{"value":"South America-Centaurus","label":"South America-Centaurus"},{"value":"South America-Cepheu","label":"South America-Cepheu"},{"value":"South America-Columba","label":"South America-Columba"},{"value":"South America-Corvus","label":"South America-Corvus"},{"value":"South America-Cygnus","label":"South America-Cygnus"},{"value":"South America-Grus","label":"South America-Grus"},{"value":"South America-Hydra","label":"South America-Hydra"},{"value":"South America-Lyra","label":"South America-Lyra"},{"value":"South America-Ophiuchus","label":"South America-Ophiuchus"},{"value":"South America-Pyxis","label":"South America-Pyxis"},{"value":"Southeast Asia-Phantasia","label":"Southeast Asia-Phantasia"},{"value":"Southeast Asia-Mechafield","label":"Southeast Asia-Mechafield"},{"value":"Southeast Asia-Ethereal Dream","label":"Southeast Asia-Ethereal Dream"},{"value":"Southeast Asia-Odyssey","label":"Southeast Asia-Odyssey"},{"value":"Southeast Asia-Aestral-Noa","label":"Southeast Asia-Aestral-Noa"},{"value":"Southeast Asia-Osillron","label":"Southeast Asia-Osillron"},{"value":"Southeast Asia-Chandra","label":"Southeast Asia-Chandra"},{"value":"Southeast Asia-Saeri","label":"Southeast Asia-Saeri"},{"value":"Southeast Asia-Aeria","label":"Southeast Asia-Aeria"},{"value":"Southeast Asia-Scarlet","label":"Southeast Asia-Scarlet"},{"value":"Southeast Asia-Gumi Gumi","label":"Southeast Asia-Gumi Gumi"},{"value":"Southeast Asia-Fantasia","label":"Southeast Asia-Fantasia"},{"value":"Southeast Asia-Oryza","label":"Southeast Asia-Oryza"},{"value":"Southeast Asia-Stardust","label":"Southeast Asia-Stardust"},{"value":"Southeast Asia-Arcania","label":"Southeast Asia-Arcania"},{"value":"Southeast Asia-Animus","label":"Southeast Asia-Animus"},{"value":"Southeast Asia-Mistilteinn","label":"Southeast Asia-Mistilteinn"},{"value":"Southeast Asia-Valhalla","label":"Southeast Asia-Valhalla"},{"value":"Southeast Asia-Illyrians","label":"Southeast Asia-Illyrians"},{"value":"Southeast Asia-Florione","label":"Southeast Asia-Florione"},{"value":"Southeast Asia-Oneiros","label":"Southeast Asia-Oneiros"},{"value":"Southeast Asia-Famtosyana","label":"Southeast Asia-Famtosyana"},{"value":"Southeast Asia-Edenia","label":"Southeast Asia-Edenia"},{"value":"Southeast Asia-Tore de Utopia","label":"Southeast Asia-Tore de Utopia"}]	2025-11-12 13:17:55.114965
\.


--
-- Data for Name: gallery; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.gallery (id, types, branch_id, url, is_active) FROM stdin;
2	popup	5	https://res.cloudinary.com/dikf91ikq/image/upload/v1761202277/uploads/uploads/kaskusgamingofc_presents_hanzo_mobile_legends_by_kaskusgamingofficial_dkbcz6s-414w-2x.jpg	t
3	popup	1	https://res.cloudinary.com/dikf91ikq/image/upload/v1761202277/uploads/uploads/kaskusgamingofc_presents_hanzo_mobile_legends_by_kaskusgamingofficial_dkbcz6s-414w-2x.jpg	t
1	banner	5	https://res.cloudinary.com/dikf91ikq/image/upload/v1759733921/mkstore/other/digital-top-up-home-banner_xuwhve.jpg	t
5	banner	2	https://res.cloudinary.com/dikf91ikq/image/upload/v1761587775/uploads/uploads/unnamed.png	t
\.


--
-- Data for Name: list_domain; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.list_domain (id, kode_payment, name, price) FROM stdin;
2	PAKETSUP3	.com	170000
3	PAKETSUP3	.net	160000
4	PAKETSUP6	.my.id	11000
5	PAKETSUP6	.com	160000
6	PAKETSUP6	.net	150000
7	PAKETSUP12	.my.id	10000
8	PAKETSUP12	.com	150000
9	PAKETSUP12	.net	140000
11	PAKETLEG3	.com	180000
12	PAKETLEG3	.net	170000
13	PAKETLEG6	.my.id	12000
14	PAKETLEG6	.com	170000
15	PAKETLEG6	.net	160000
17	PAKETLEG12	.com	160000
20	PAKETPRO3	.com	190000
21	PAKETPRO3	.net	180000
22	PAKETPRO6	.my.id	14000
23	PAKETPRO6	.com	180000
24	PAKETPRO6	.net	170000
29	PAKETBAS3	.com	200000
31	PAKETBAS6	.my.id	15000
32	PAKETBAS6	.com	190000
33	PAKETBAS6	.net	180000
34	PAKETBAS12	.my.id	14000
35	PAKETBAS12	.com	180000
36	PAKETBAS12	.net	170000
37	PAKETSUP3	.my.id	12000
38	PAKETSUP3	.id	25000
39	PAKETSUP3	.web.id	20000
40	PAKETSUP3	.sch.id	15000
41	PAKETSUP3	.com	170000
43	PAKETSUP3	.org	150000
44	PAKETSUP3	.biz	145000
45	PAKETSUP3	.info	140000
46	PAKETSUP3	.store	155000
47	PAKETSUP3	.xyz	90000
48	PAKETSUP3	.online	130000
49	PAKETSUP3	.tech	140000
50	PAKETSUP3	.co.id	35000
51	PAKETSUP6	.my.id	11000
52	PAKETSUP6	.id	24000
53	PAKETSUP6	.web.id	19000
54	PAKETSUP6	.com	160000
55	PAKETSUP6	.net	150000
56	PAKETSUP6	.org	145000
57	PAKETSUP6	.xyz	85000
58	PAKETSUP6	.online	120000
59	PAKETSUP6	.store	150000
60	PAKETSUP6	.biz	140000
61	PAKETSUP6	.info	135000
62	PAKETSUP6	.co.id	33000
63	PAKETSUP12	.my.id	10000
64	PAKETSUP12	.id	22000
65	PAKETSUP12	.web.id	18000
66	PAKETSUP12	.com	150000
67	PAKETSUP12	.net	140000
68	PAKETSUP12	.org	135000
69	PAKETSUP12	.xyz	80000
70	PAKETSUP12	.online	110000
71	PAKETSUP12	.tech	130000
72	PAKETSUP12	.store	140000
73	PAKETSUP12	.co.id	31000
74	PAKETLEG3	.my.id	13000
75	PAKETLEG3	.id	26000
76	PAKETLEG3	.web.id	21000
77	PAKETLEG3	.com	180000
79	PAKETLEG3	.org	160000
80	PAKETLEG3	.xyz	95000
81	PAKETLEG3	.online	140000
82	PAKETLEG3	.store	160000
83	PAKETLEG3	.tech	145000
84	PAKETLEG3	.co.id	36000
85	PAKETLEG6	.my.id	12000
86	PAKETLEG6	.id	25000
87	PAKETLEG6	.web.id	20000
88	PAKETLEG6	.com	170000
89	PAKETLEG6	.net	160000
90	PAKETLEG6	.org	150000
91	PAKETLEG6	.xyz	90000
92	PAKETLEG6	.online	130000
93	PAKETLEG6	.store	150000
94	PAKETLEG6	.tech	140000
95	PAKETLEG6	.co.id	34000
96	PAKETLEG12	.my.id	11000
97	PAKETLEG12	.id	23000
98	PAKETLEG12	.web.id	19000
99	PAKETLEG12	.com	160000
100	PAKETLEG12	.net	150000
101	PAKETLEG12	.org	140000
102	PAKETLEG12	.xyz	85000
103	PAKETLEG12	.online	120000
104	PAKETLEG12	.store	140000
105	PAKETLEG12	.tech	130000
106	PAKETLEG12	.co.id	32000
107	PAKETPRO3	.my.id	15000
108	PAKETPRO3	.id	28000
109	PAKETPRO3	.web.id	22000
110	PAKETPRO3	.com	190000
112	PAKETPRO3	.org	170000
113	PAKETPRO3	.xyz	100000
117	PAKETPRO3	.co.id	38000
118	PAKETPRO6	.my.id	14000
119	PAKETPRO6	.id	26000
120	PAKETPRO6	.web.id	21000
121	PAKETPRO6	.com	180000
122	PAKETPRO6	.net	170000
123	PAKETPRO6	.org	160000
124	PAKETPRO6	.xyz	95000
125	PAKETPRO6	.online	140000
126	PAKETPRO6	.store	160000
127	PAKETPRO6	.tech	140000
128	PAKETPRO6	.co.id	35000
129	PAKETPRO12	.my.id	13000
130	PAKETPRO12	.id	24000
131	PAKETPRO12	.web.id	20000
132	PAKETPRO12	.com	170000
133	PAKETPRO12	.net	160000
134	PAKETPRO12	.org	150000
135	PAKETPRO12	.xyz	90000
136	PAKETPRO12	.online	130000
137	PAKETPRO12	.store	150000
138	PAKETPRO12	.tech	130000
139	PAKETPRO12	.co.id	33000
140	PAKETBAS3	.my.id	16000
141	PAKETBAS3	.id	30000
142	PAKETBAS3	.web.id	24000
143	PAKETBAS3	.com	200000
144	PAKETBAS3	.net	190000
145	PAKETBAS3	.org	180000
146	PAKETBAS3	.xyz	105000
147	PAKETBAS3	.online	160000
148	PAKETBAS3	.store	180000
149	PAKETBAS3	.tech	160000
150	PAKETBAS3	.co.id	40000
151	PAKETBAS6	.my.id	15000
152	PAKETBAS6	.id	28000
153	PAKETBAS6	.web.id	23000
154	PAKETBAS6	.com	190000
155	PAKETBAS6	.net	180000
156	PAKETBAS6	.org	170000
157	PAKETBAS6	.xyz	100000
158	PAKETBAS6	.online	150000
159	PAKETBAS6	.store	170000
160	PAKETBAS6	.tech	150000
161	PAKETBAS6	.co.id	37000
162	PAKETBAS12	.my.id	14000
163	PAKETBAS12	.id	26000
164	PAKETBAS12	.web.id	22000
165	PAKETBAS12	.com	180000
166	PAKETBAS12	.net	170000
167	PAKETBAS12	.org	160000
168	PAKETBAS12	.xyz	95000
169	PAKETBAS12	.online	140000
170	PAKETBAS12	.store	160000
171	PAKETBAS12	.tech	140000
172	PAKETBAS12	.co.id	35000
\.


--
-- Data for Name: list_web_cabang; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.list_web_cabang (id, url, image) FROM stdin;
1	https://cabang1.udatopup.com	\N
2	https://cabang2.udatopup.com	\N
3	https://cabang3.udatopup.com	\N
\.


--
-- Data for Name: memberships; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.memberships (id, name, price, role_id, duration, benefit, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: notification_templates; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.notification_templates (id, branch_id, notification_type, via, subject_message, title, body, variables, is_active, created_at, updated_at) FROM stdin;
4	1	transactions_paid	whatsapp		✅ PEMBAYARAN BERHASIL	<p>Halo! Pembayaran Anda telah berhasil kami terima.</p><p><br></p><p>📋 Detail Transaksi:</p><p>- Produk: [produk]</p><p>- Nomor Invoice: [no_invoice]</p><p>- Status: [status]✅</p><p><br></p><p>🔄 Transaksi Anda sedang diproses dan akan segera diselesaikan.</p><p>🔗 Link Invoice:</p><p>[domain]/invoice/[no_invoice]</p><p><br></p><p>Terima kasih telah melakukan pembayaran. Kami akan segera memproses pesanan Anda.</p><p><br></p><p>📞 Jika ada pertanyaan, silakan hubungi customer service kami.</p>	["no_invoice", "produk", "status", "domain"]	t	2025-10-19 08:13:18.297002	2025-10-19 08:24:23.224057
5	1	transactions_failed	whatsapp		❌ TRANSAKSI GAGAL	<p>Maaf, transaksi Anda mengalami kegagalan.</p><p> 📋 *Detail Transaksi:* </p><p> • Produk: [produk] </p><p> • Nomor Invoice: [no_invoice] </p><p> • Status: [status] ❌ </p><p> 🔗 *Link Invoice:* [domain]/invoice/[no_invoice] ━━━━━━━━━━━━━━━━━━ 🎁 *AKUN ANDA TELAH DIBUAT!*</p><p> Silakan login untuk melanjutkan transaksi: 👤 *Username:* [username]</p><p> 🔑 *Password:* [password]</p><p> 🔗 *Link Login:* [domain]/login</p><p> ━━━━━━━━━━━━━━━━━━</p><p> </p><p> 🔄 *Silakan coba kembali dengan:* </p><p> • Periksa kembali ID Game Anda </p><p> • Pastikan saldo mencukupi </p><p> • Login terlebih dahulu ke akun Anda</p><p> </p><p> 📞 *Butuh Bantuan?* Jika masalah berlanjut, silakan hubungi customer service kami untuk bantuan lebih lanjut.</p><p> Terima kasih!</p>	["domain", "no_invoice", "password", "produk", "status", "username"]	t	2025-10-19 08:17:33.350955	2025-11-17 03:35:25.791519
8	1	reset_password	email	noreply@udatopup.com	Reset Password - UDATOPUP	<p>&lt;!DOCTYPE html&gt;</p><p>&lt;html&gt;</p><p>&lt;head&gt;</p><p>&nbsp;&nbsp;&lt;meta charset="UTF-8"&gt;</p><p>&nbsp;&nbsp;&lt;meta name="viewport" content="width=device-width, initial-scale=1.0"&gt;</p><p>&nbsp;&nbsp;&lt;style&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;* {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin: 0;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 0;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;box-sizing: border-box;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;body {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background-color: #f5f5f5;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: #333;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;.container {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;max-width: 600px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin: 0 auto;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background-color: #ffffff;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border-radius: 8px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;overflow: hidden;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;box-shadow: 0 2px 4px rgba(0,0,0,0.1);</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;.header {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background: linear-gradient(135deg, #e0861eff 0%, #ecb51cff 100%);</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: white;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 40px 20px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text-align: center;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;.header h1 {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-size: 28px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin-bottom: 5px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;.content {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 40px 30px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;.greeting {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-size: 16px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin-bottom: 20px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;line-height: 1.6;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;.message {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-size: 14px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: #666;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin-bottom: 30px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;line-height: 1.8;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;.cta-button {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;display: inline-block;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background: linear-gradient(135deg, #e0861eff 0%, #ecb51cff 100%);</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: white;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 14px 40px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border-radius: 6px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text-decoration: none;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-weight: 600;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin: 30px 0;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text-align: center;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;.cta-button:hover {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;opacity: 0.9;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text-decoration: none;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;.link-alternative {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin-top: 20px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 15px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background-color: #f9f9f9;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border-left: 4px solid #d3a920ff;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border-radius: 4px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-size: 13px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: #666;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;.link-alternative p {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin-bottom: 8px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;word-break: break-all;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;.link-alternative a {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: black;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text-decoration: none;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;.expiry-note {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background-color: #fff3cd;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border: 1px solid #ffc107;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border-radius: 4px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 12px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin: 20px 0;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-size: 13px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: #856404;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;.footer {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background-color: #f9f9f9;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 20px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text-align: center;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-size: 12px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: #999;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border-top: 1px solid #eee;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;.footer p {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin: 5px 0;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;.divider {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;height: 1px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background-color: #eee;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin: 30px 0;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&lt;/style&gt;</p><p>&lt;/head&gt;</p><p>&lt;body&gt;</p><p>&nbsp;&nbsp;&lt;div class="container"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;div class="header"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h1&gt;[app_name]&lt;/h1&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p&gt;Reset Password&lt;/p&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;div class="content"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p class="greeting"&gt;Halo [user_name],&lt;/p&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p class="message"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kami menerima permintaan untuk mereset password akun Anda.&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Jika Anda tidak melakukan permintaan ini, abaikan email ini dan password Anda akan tetap aman.</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/p&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p style="text-align: center;"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;a href="[reset_link]" class="cta-button"&gt;Reset Password&lt;/a&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/p&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;div class="expiry-note"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;⏰ Link reset password ini berlaku selama &lt;strong&gt;[expiry_minutes] menit&lt;/strong&gt;.&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Segera reset password Anda sebelum link ini kadaluarsa.</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;div class="link-alternative"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p&gt;&lt;strong&gt;Atau copy link berikut ke browser Anda:&lt;/strong&gt;&lt;/p&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p&gt;&lt;a href="[reset_link]"&gt;RESET_LINK&lt;/a&gt;&lt;/p&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;div class="divider"&gt;&lt;/div&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p style="font-size: 13px; color: #999;"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pertanyaan keamanan? Jangan bagikan link ini kepada siapapun.&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tim kami tidak akan pernah meminta password Anda melalui email.</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/p&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;div class="footer"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p&gt;&amp;copy; 2025 [app_name]. Semua hak dilindungi.&lt;/p&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p&gt;Email ini dikirim ke akun Anda karena ada permintaan reset password.&lt;/p&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;</p><p>&nbsp;&nbsp;&lt;/div&gt;</p><p>&lt;/body&gt;</p><p>&lt;/html&gt;</p>	["</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background-color: #f9f9f9;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 20px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text-align: center;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-size: 12px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: #999;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border-top: 1px solid #eee;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background-color: #fff3cd;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border: 1px solid #ffc107;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border-radius: 4px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 12px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin: 20px 0;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-size: 13px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: #856404;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background: linear-gradient(135deg, #e0861eff 0%, #ecb51cff 100%);</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: white;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 40px 20px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text-align: center;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: black;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text-decoration: none;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;display: inline-block;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background: linear-gradient(135deg, #e0861eff 0%, #ecb51cff 100%);</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: white;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 14px 40px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border-radius: 6px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text-decoration: none;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-weight: 600;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin: 30px 0;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text-align: center;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background-color: #f5f5f5;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: #333;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-size: 14px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: #666;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin-bottom: 30px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;line-height: 1.8;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-size: 16px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin-bottom: 20px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;line-height: 1.6;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-size: 28px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin-bottom: 5px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;height: 1px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background-color: #eee;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin: 30px 0;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin-bottom: 8px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;word-break: break-all;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin-top: 20px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 15px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background-color: #f9f9f9;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border-left: 4px solid #d3a920ff;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border-radius: 4px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-size: 13px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: #666;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin: 0;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 0;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;box-sizing: border-box;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin: 5px 0;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;max-width: 600px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin: 0 auto;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background-color: #ffffff;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border-radius: 8px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;overflow: hidden;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;box-shadow: 0 2px 4px rgba(0,0,0,0.1);</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;opacity: 0.9;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text-decoration: none;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 40px 30px;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;", "app_name", "expiry_minutes", "reset_link", "user_name"]	t	2025-10-19 08:36:32.872803	2025-10-19 08:36:32.872803
7	1	transactions_failed_admin	whatsapp		❌ TRANSAKSI GAGAL	<p>Maaf, transaksi Anda mengalami kegagalan.</p><p> 📋 *Detail Transaksi:* </p><p> • Produk: [produk] </p><p> • Nomor Invoice: [no_invoice] </p><p> • Status: [status] ❌ </p><p> 🔗 *Link Invoice:* [domain]/invoice/[no_invoice] ━━━━━━━━━━━━━━━━━━ 🎁 *AKUN ANDA TELAH DIBUAT!*</p><p> Silakan login untuk melanjutkan transaksi: 👤 *Username:* [username]</p><p> 🔑 *Password:* [password]</p><p> 🔗 *Link Login:* [domain]/login</p><p> ━━━━━━━━━━━━━━━━━━</p><p> </p><p> 🔄 *Silakan coba kembali dengan:* </p><p> • Periksa kembali ID Game Anda </p><p> • Pastikan saldo mencukupi </p><p> • Login terlebih dahulu ke akun Anda</p><p> </p><p> 📞 *Butuh Bantuan?* Jika masalah berlanjut, silakan hubungi customer service kami untuk bantuan lebih lanjut.</p><p> Terima kasih!</p>	["domain", "no_invoice", "password", "produk", "status", "username"]	t	2025-10-19 08:28:10.748975	2025-11-17 03:34:55.670788
6	1	transactions_pending	whatsapp		⏳ MENUNGGU PEMBAYARAN	<p>Halo! Pesanan Anda telah dibuat dan menunggu pembayaran.</p><p><br></p><p>📋 Detail Transaksi:</p><p>- Produk: [produk]</p><p>- Nomor Invoice : [no_invoice]</p><p>- Status: [status] ⏳</p><p><br></p><p>💳 Instruksi Pembayaran:</p><p>Silakan selesaikan pembayaran sesuai metode yang Anda pilih. Setelah pembayaran berhasil, sistem akan otomatis memverifikasi dan memproses pesanan Anda.</p><p><br></p><p>⚠️ Perhatian:&nbsp;</p><p>- Transaksi akan otomatis dibatalkan jika tidak ada pembayaran dalam waktu yang ditentukan</p><p>- Pastikan nominal pembayaran sesuai dengan yang tertera</p><p>- Jangan lupa simpan bukti pembayaran Anda</p><p><br></p><p>⏱️ Menunggu konfirmasi pembayaran dari sistem...</p><p><br></p><p>📞 Butuh bantuan? Hubungi customer service kami.</p>	["no_invoice", "produk", "status", "domain"]	t	2025-10-19 08:17:49.186527	2025-10-19 08:17:49.186527
9	1	transactions_failed_reseller	whatsapp	 	❌ TRANSAKSI GAGAL	<p>Maaf, transaksi Anda mengalami kegagalan.</p><p> 📋 *Detail Transaksi:* </p><p> • Produk: [produk] </p><p> • Nomor Invoice: [no_invoice] </p><p> • Status: [status] ❌ </p><p> 🔗 *Link Invoice:* [domain]/invoice/[no_invoice] ━━━━━━━━━━━━━━━━━━ 🎁 *AKUN ANDA TELAH DIBUAT!*</p><p> Silakan login untuk melanjutkan transaksi: 👤 *Username:* [username]</p><p> 🔑 *Password:* [password]</p><p> 🔗 *Link Login:* [domain]/login</p><p> ━━━━━━━━━━━━━━━━━━</p><p> </p><p> 🔄 *Silakan coba kembali dengan:* </p><p> • Periksa kembali ID Game Anda </p><p> • Pastikan saldo mencukupi </p><p> • Login terlebih dahulu ke akun Anda</p><p> </p><p> 📞 *Butuh Bantuan?* Jika masalah berlanjut, silakan hubungi customer service kami untuk bantuan lebih lanjut.</p><p> Terima kasih!</p>	["domain", "no_invoice", "password", "produk", "status", "username"]	t	2025-10-30 06:43:59.319727	2025-11-17 03:34:46.359701
10	1	transactions_failed_user	whatsapp		❌ TRANSAKSI GAGAL	<p>Maaf, transaksi Anda mengalami kegagalan.<br />  📋 *Detail Transaksi:* <br /> • Produk: [produk] <br /> • Nomor Invoice: [no_invoice] <br />  • Status: [status] ❌ <br />  🔗 *Link Invoice:*  [domain]/invoice/[no_invoice]   ━━━━━━━━━━━━━━━━━━  🎁 *AKUN ANDA TELAH DIBUAT!*<br />  Silakan login untuk melanjutkan transaksi:  👤 *Username:* [username]<br />  🔑 *Password:* [password]<br />  🔗 *Link Login:* [domain]/login<br /> ━━━━━━━━━━━━━━━━━━<br /> <br /> 🔄 *Silakan coba kembali dengan:* <br /> • Periksa kembali ID Game Anda <br /> • Pastikan saldo mencukupi <br /> • Login terlebih dahulu ke akun Anda<br />  <br /> 📞 *Butuh Bantuan?* Jika masalah berlanjut, silakan hubungi customer service kami untuk bantuan lebih lanjut.<br /> Terima kasih! </p>	["no_invoice", "produk", "status", "domain", "username", "password"]	t	2025-11-04 15:22:19.643595	2025-11-04 15:28:43.240181
11	1	transactions_success	whatsapp	 	✅ PESANAN BERHASIL	<p>Halo! Pesananan Anda telah berhasil kami terima.</p><p><br></p><p>📋 Detail Transaksi:</p><p>- Produk: [produk]</p><p>- Nomor Invoice: [no_invoice]</p><p>- Status: [status]✅</p><p><br></p><p>🔄 Transaksi Anda sedang diproses dan akan segera diselesaikan.</p><p>🔗 Link Invoice:</p><p>[domain]/invoice/[no_invoice]</p><p><br></p><p>Terima kasih telah melakukan pembayaran. Kami akan segera memproses pesanan Anda.</p><p><br></p><p>📞 Jika ada pertanyaan, silakan hubungi customer service kami.</p>	["no_invoice", "produk", "status", "domain"]	t	2025-11-07 09:46:53.638948	2025-11-07 09:46:53.638948
\.


--
-- Data for Name: packet_features; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.packet_features (id, code, name, created_at) FROM stdin;
1	custom_domain	Custom Domain	2025-10-25 18:17:13.422175
2	custom_products	Custom Products	2025-10-25 18:17:13.422175
3	analytics	Analytics Dashboard	2025-10-25 18:17:13.422175
4	priority_support	Priority Support	2025-10-25 18:17:13.422175
5	flash_sale	Flash Sale	2025-10-25 18:17:13.422175
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.password_resets (id, email, token, token_hash, expires_at, created_at, is_used, used_at) FROM stdin;
1	wafiq610@gmail.com	7cda2f1c429bf46c7d27c52fdc69a62fe8ddafb33e1a24b7e829cfeae955c2e4	f054602bbe75351894122d17a923b290e9e36c185865d7b91543f3296ca38b25	2025-10-10 10:41:16.137071	2025-10-10 10:26:16.137071	f	\N
2	wafiq610@gmail.com	6cd532d788dbd818390fbab6a280d24799c2cc157db9874f35e8cc49edbad70e	c11b2fe39eac5dad7efed7bca12365f3e7e5e5e9d8d2fdae47e3206a6077bdd3	2025-10-10 10:42:56.766095	2025-10-10 10:27:56.766095	f	\N
3	wafiq610@gmail.com	a7577cf8a30c2e6675a826466fbe5f8ed176be97e94b582f20404335c95d5632	c70051fd735e7b4a690df647e4c9f4877dde964141f8268d2870c61736280610	2025-10-10 10:43:55.417847	2025-10-10 10:28:55.417847	f	\N
4	wafiq610@gmail.com	5c66ce081c4e1f8d22b263725921895bfa8b797b8ec71212b16f96cf06a67e03	79712d9b9629e982ec7061647ca7f4bebce7120f0aa905e07b4c4caf8cd1c639	2025-10-10 10:46:51.319839	2025-10-10 10:31:51.319839	f	\N
5	wafiq610@gmail.com	985d95e3058f1255549b2238d4e26755573dced68e784b46ddb3bf161ced2e6d	9f5af9e60c971839f6a9ec060e7fd4b453f251e1a5c559a6c436a6469f0eb173	2025-10-10 10:47:55.854378	2025-10-10 10:32:55.854378	f	\N
6	wafiq610@gmail.com	3a6da855b131e72b53e235b728ff95a9ba039761b418e85f1e235d8655176550	c94f66247b36d8f9fa35d5f678d66c994f3fe7773319ec25c2d0ad213d0fb86c	2025-10-10 10:57:21.247719	2025-10-10 10:42:21.247719	f	\N
7	wafiq610@gmail.com	7a8fbc66a428b8e83ceb9134fe1371ccabc43b62ae05a36d707ec8ced413da55	e8b747aa544cafffa5e241587e320ed74c11a205dbfbfdfce99bab58ca83ffef	2025-10-10 11:00:28.289828	2025-10-10 10:45:28.289828	f	\N
8	wafiq610@gmail.com	00b285c355cbd902dfda80dc22dd1cc590333c7ab59c6b9a513fb5e8cd941ea4	5caea641042cee2c2a7f2d5e53658b9b82358d201d7f06eeafa4c1a072dc1139	2025-10-10 11:05:18.871788	2025-10-10 10:50:18.871788	f	\N
9	wafiq610@gmail.com	97a3009c54e0aebf9a02ef01de588eab7d9f1f33fb96755701192750babae3a9	6b80649d434b4c41533f094a3ac08584bf65f4c3f0a575cc69df2c8482ad508c	2025-10-10 11:06:34.226674	2025-10-10 10:51:34.226674	f	\N
10	wafiq610@gmail.com	076822727cb695a30a3b2e1b5e77c519793d720be5a827859f82a5d2adefa38d	686a02f663627ec7997e3258be9c736d77b2db5bb9c33bb2270a2805c6d3e242	2025-10-10 11:08:33.079731	2025-10-10 10:53:33.079731	f	\N
11	wafiq610@gmail.com	c499ffc81801da3b12602280f049432e6ca75acf1e2081793e81d1e7c2701a0f	45ba70d79128ee7068615bc3ce53d09b38f364b2a18eeefceafe277b6a9ff5c3	2025-10-10 11:10:52.956772	2025-10-10 10:55:52.956772	f	\N
12	wafiq610@gmail.com	34e019655b972f8d3735046202fcfe7f09573e29b0ac30f0372ab721b6f64c41	15537a3dfa2f9ad70acaaaa116b5ef4615922bbe0325ea1fdc783622f26110e0	2025-10-10 13:27:19.551553	2025-10-10 13:12:19.551553	t	2025-10-10 13:40:07.747402
\.


--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.payment_methods (id, code, name, description, image, type, min_amount, max_amount, is_active, created_at, updated_at) FROM stdin;
7	I1	BNI Virtual Account	Dicek Otomatis	https://res.cloudinary.com/dazayhg7s/image/upload/v1741400165/bniva_1_r9e6fi.webp	virtual-account	10000	0	t	2022-11-19 13:51:12	2023-04-22 10:47:15
9	BR	BRI Virtual Account	Dicek Otomatis	https://res.cloudinary.com/dazayhg7s/image/upload/v1741400218/briva_2_zcyhva.webp	virtual-account	10000	0	t	2022-11-19 13:52:16	2023-04-22 10:47:57
10	B1	CIMB Virtual Account	Dicek Otomatis	https://res.cloudinary.com/dazayhg7s/image/upload/v1741400231/cimbva_2_ld6vkq.webp	virtual-account	10000	0	t	2022-11-19 13:52:53	2023-04-22 10:48:16
30	DA	DANA	Dicek Otomatis	https://res.cloudinary.com/dazayhg7s/image/upload/v1741400398/DA_tipuyt.webp	e-wallet	1000	0	t	2023-09-01 17:03:36	2023-09-14 05:46:53
16	SQ	QRIS ( All Payment )	Dicek Otomatis	https://res.cloudinary.com/dazayhg7s/image/upload/v1741400371/qrislogo_zbwmey.png	qris	0	0	t	2022-11-19 13:58:45	2025-10-24 14:41:40.015156
31	OV	OVO	Dicek Otomatis	https://res.cloudinary.com/dazayhg7s/image/upload/v1741400382/97c7a69b-6600-43aa-e9ad-bdffadb6ae16_dkbw20.webp	e-wallet	1000	0	t	2023-09-02 02:59:46	2025-10-24 14:45:06.049838
28	M2	Mandiri Virtual Account	Dicek Otomatis	https://res.cloudinary.com/dazayhg7s/image/upload/v1741400357/mandiri_gjkja5.webp	virtual-account	10000	0	t	2023-07-16 17:57:37	2025-11-09 01:50:51.308657
26	FT	Covience Store	Dicek Otomatis	https://res.cloudinary.com/dazayhg7s/image/upload/v1741400201/RETAIL_j8afv9.webp	cstore	0	0	t	2023-07-16 17:30:19	2025-05-29 07:25:46.611
34	VA	Maybank	Dicek Otomatis	https://res.cloudinary.com/dazayhg7s/image/upload/v1741400427/VA_vbtm8p.webp	virtual-account	10000	1000000	t	2023-09-03 10:59:01	2025-10-21 00:09:30.648762
13	BT	PERMATA Virtual Account	Dicek Otomatis	https://res.cloudinary.com/dazayhg7s/image/upload/v1741400249/permatava_2_ftn5do.webp	virtual-account	10000	0	t	2022-11-19 13:55:22	2025-10-23 15:36:00.439244
33	SA	ShopeePay	Dicek Otomatis	https://res.cloudinary.com/dazayhg7s/image/upload/v1741400410/Shopeepay_dy9uul.png	e-wallet	11000	1000	t	2023-09-02 07:00:41	2025-10-24 14:39:38.406349
\.


--
-- Data for Name: popup_desc; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.popup_desc (id, title, description, branch_id) FROM stdin;
8	Follow Channel WA & IG Oura Store	<p><br></p><p><a href="https://vazzuniverse.id/" rel="noopener noreferrer" target="_blank">Klik Disini</a> untuk follow saluran/channel <strong>INSTAGRAM </strong>Test</p><p><a href="https://vazzuniverse.id/" rel="noopener noreferrer" target="_blank">Klik Disin</a>i untuk follow saluran/channel <strong>WHATSAPP </strong>Test</p><p><br></p><p>Info daget (lebih cepat), promo, berita, link mabar, dll</p><p>ada disini semuanya Follow duluu yukk,</p><p><br></p><p>kali aja berguna nanti nya :D</p>	5
\.


--
-- Data for Name: product_providers; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.product_providers (id, provider_id, product_code, provider_price, is_active, created_at, updated_at, product_id, is_deleted, custom_price) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.products (id, name, code, category_brand, base_price, main_provider_id, description, is_active, is_deleted, created_at, updated_at, type, margin_amount, margin_percentage, calculation_type) FROM stdin;
2761	10 Diamonds	SDDD10	Speed Drifters	2025	\N	\N	f	f	2025-11-10 09:44:47.421983	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2762	25 Diamonds	SDDD25	Speed Drifters	4990	\N	\N	f	f	2025-11-10 09:44:47.421983	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2395	Limited Special Gift 	REPPLS	Ragnarok M Eternal Love	115000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	REPP	0	4.00	hybrid
2396	1.058 Jade (920 + 138 Bonus) 	RIJA1058	Revelation Infinite Journey	168000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIJA	0	4.00	hybrid
2397	10.580 Jade (9.200 + 1.380 Bonus)	RIJA10K5	Revelation Infinite Journey	1675000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIJA	0	4.00	hybrid
2398	127 Jade (110 + 17 Bonus)	RIJA127	Revelation Infinite Journey	21000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIJA	0	4.00	hybrid
2399	1.323 Jade (1.150 + 173 Bonus) 	RIJA1323	Revelation Infinite Journey	210000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIJA	0	4.00	hybrid
2400	1.587 Jade (1.380 + 207 Bonus) 	RIJA1587	Revelation Infinite Journey	252000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIJA	0	4.00	hybrid
2401	1.852 Jade (1.610 + 242 Bonus)	RIJA1852	Revelation Infinite Journey	294000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIJA	0	4.00	hybrid
2402	2.645 Jade (2.300 + 345 Bonus) 	RIJA2645	Revelation Infinite Journey	420000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIJA	0	4.00	hybrid
2403	265 Jade (230 + 35 Bonus)	RIJA265	Revelation Infinite Journey	42000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIJA	0	4.00	hybrid
2404	26.450 Jade (23.000 + 3.450 Bonus)	RIJA26K4	Revelation Infinite Journey	4190000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIJA	0	4.00	hybrid
2405	3.703 Jade (3.220 + 483 Bonus)	RIJA3703	Revelation Infinite Journey	587000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIJA	0	4.00	hybrid
2406	46 Jade (40 + 6 Bonus)	RIJA46	Revelation Infinite Journey	9000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIJA	0	4.00	hybrid
2407	529 Jade (460 + 69 Bonus)	RIJA529	Revelation Infinite Journey	84000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIJA	0	4.00	hybrid
2408	5.290 Jade (4.600 + 690 Bonus)	RIJA5290	Revelation Infinite Journey	838000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIJA	0	4.00	hybrid
2409	Battle Pass (Package)	RIPPBP	Revelation Infinite Journey	54000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIPP	0	4.00	hybrid
2410	Battle Pass Plus (Package)	RIPPBPP	Revelation Infinite Journey	108000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIPP	0	4.00	hybrid
2411	Growth Fund (Package)	RIPPGF	Revelation Infinite Journey	108000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIPP	0	4.00	hybrid
2412	Monthly Card (Package)	RIPPMC	Revelation Infinite Journey	54000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIPP	0	4.00	hybrid
2413	Newbie Pack (Package) 	RIPPNP	Revelation Infinite Journey	9000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIPP	0	4.00	hybrid
1451	144 (Diamonds)	AUDM144	AU2 Mobile	25500	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-10-28 15:26:57.341042	AUDM	0	4.00	hybrid
1452	1536 (Diamonds)	AUDM1536	AU2 Mobile	261500	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-10-28 15:26:57.341042	AUDM	0	4.00	hybrid
1453	2376 (Diamonds)	AUDM2376	AU2 Mobile	383800	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-10-28 15:26:57.341042	AUDM	0	4.00	hybrid
1454	360 (Diamonds)	AUDM360	AU2 Mobile	65700	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-10-28 15:26:57.341042	AUDM	0	4.00	hybrid
1455	3936 (Diamonds)	AUDM3936	AU2 Mobile	646000	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-10-28 15:26:57.341042	AUDM	0	4.00	hybrid
1456	72 (Diamonds)	AUDM72	AU2 Mobile	13150	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-10-28 15:26:57.341042	AUDM	0	4.00	hybrid
1457	7776 (Diamonds)	AUDM7776	AU2 Mobile	131100	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-10-28 15:26:57.341042	AUDM	0	4.00	hybrid
1458	816 (Diamonds)	AUDM816	AU2 Mobile	130300	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-10-28 15:26:57.341042	AUDM	0	4.00	hybrid
2765	1.180 + 120 Tokens	ACTO1180	ACE RACER	228710	\N	\N	t	f	2025-11-12 19:55:49.363823	2025-11-12 19:55:49.363823	ACTO	0	4.00	hybrid
2766	250 + 20 Tokens	ACTO250	ACE RACER	50665	\N	\N	t	f	2025-11-12 19:55:49.363823	2025-11-12 19:55:49.363823	ACTO	0	4.00	hybrid
2767	2.880 + 300 Tokens	ACTO2880	ACE RACER	582505	\N	\N	t	f	2025-11-12 19:55:49.363823	2025-11-12 19:55:49.363823	ACTO	0	4.00	hybrid
2768	5.880 + 650 Tokens	ACTO5880	ACE RACER	1142065	\N	\N	t	f	2025-11-12 19:55:49.363823	2025-11-12 19:55:49.363823	ACTO	0	4.00	hybrid
2769	60 + 5 Tokens	ACTO60	ACE RACER	12515	\N	\N	t	f	2025-11-12 19:55:49.363823	2025-11-12 19:55:49.363823	ACTO	0	4.00	hybrid
2414	Webpay Gift (Newbie)	RIPPWGN	Revelation Infinite Journey	9000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIPP	0	4.00	hybrid
2415	Webpay Gift (Promotion)	RIPPWGP	Revelation Infinite Journey	55000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIPP	0	4.00	hybrid
2416	Webpay Gift (Special)	RIPPWGS	Revelation Infinite Journey	110000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RIPP	0	4.00	hybrid
2417	Deluxe MP	RMBDDMP	Racing Master	69000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RMBD	0	4.00	hybrid
1430	1.999 Koin Apex	AEAC1999	Age of Empires Mobile	298407	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AEAC	0	4.00	hybrid
1431	499 Koin Apex	AEAC499	Age of Empires Mobile	72367	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AEAC	0	4.00	hybrid
1432	4.999 Koin Apex	AEAC4999	Age of Empires Mobile	753635	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AEAC	0	4.00	hybrid
1433	99 Koin Apex	AEAC99	Age of Empires Mobile	14478	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AEAC	0	4.00	hybrid
1434	999 Koin Apex	AEAC999	Age of Empires Mobile	147781	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AEAC	0	4.00	hybrid
1435	9.999 Koin Apex	AEAC9999	Age of Empires Mobile	1472458	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AEAC	0	4.00	hybrid
1436	2.100 Empire Coins	AEEC2100	Age of Empires Mobile	72367	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AEEC	0	4.00	hybrid
1437	24.000 Empire Coins	AEEC24K	Age of Empires Mobile	753635	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AEEC	0	4.00	hybrid
1438	400 Empire Coins	AEEC400	Age of Empires Mobile	14478	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AEEC	0	4.00	hybrid
1480	Phantasium Pass (15 Days) + 8 Opals	CAPP15	Crystal of Atlan	39120	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CAPP	0	4.00	hybrid
1481	Phantasium Pass (30 Days) + 14 Opals	CAPP30	Crystal of Atlan	67450	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CAPP	0	4.00	hybrid
1482	1.980 Vouchers + 99 Bonus	CAVO1980	Crystal of Atlan	420250	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CAVO	0	4.00	hybrid
1483	300 Vouchers + 15 Bonus	CAVO300	Crystal of Atlan	69750	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CAVO	0	4.00	hybrid
2418	Growth Fund	RMBDGF	Racing Master	86000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RMBD	0	4.00	hybrid
2419	Monthly Card	RMBDMC	Racing Master	31000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RMBD	0	4.00	hybrid
2420	MP Combo	RMBDMPC	Racing Master	317000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RMBD	0	4.00	hybrid
2421	Premium MP	RMBDPMP	Racing Master	124000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RMBD	0	4.00	hybrid
2770	680 + 60 Tokens	ACTO680	ACE RACER	126970	\N	\N	t	f	2025-11-12 19:55:49.363823	2025-11-12 19:55:49.363823	ACTO	0	4.00	hybrid
2422	1.050 Gems (1000 + 50 Gems) 	RMGM1050	Racing Master	182000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RMGM	0	4.00	hybrid
2423	1.470 Gems (1400 + 70 Gems) 	RMGM1470	Racing Master	256000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RMGM	0	4.00	hybrid
2424	2.205 Gems (2100 + 105 Gems)	RMGM2205	Racing Master	386000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RMGM	0	4.00	hybrid
2425	3.570 Gems (3400 + 170 Gems)	RMGM3570	Racing Master	613000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RMGM	0	4.00	hybrid
2426	368 Gems (350 + 18 Gems) 	RMGM368	Racing Master	65000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RMGM	0	4.00	hybrid
2427	6.930 Gems (6600 + 330 Gems)	RMGM6930	Racing Master	1185000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RMGM	0	4.00	hybrid
2428	735 Gems (700 + 35 Gems) 	RMGM735	Racing Master	127000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RMGM	0	4.00	hybrid
2429	74 Gems (70 + 4 Gems)	RMGM74	Racing Master	13000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RMGM	0	4.00	hybrid
2430	10.290 Diamonds	RNDM10K2	Ragnarok X Next Generation	289187	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RNDM	0	4.00	hybrid
2431	15.600 Diamonds	RNDM15K6	Ragnarok X Next Generation	437648	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RNDM	0	4.00	hybrid
2432	160.540 Diamonds	RNDM160K	Ragnarok X Next Generation	4367477	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RNDM	0	4.00	hybrid
2433	2.310 Diamonds	RNDM2310	Ragnarok X Next Generation	66497	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RNDM	0	4.00	hybrid
2434	31.200 Diamonds	RNDM31K2	Ragnarok X Next Generation	874295	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RNDM	0	4.00	hybrid
2435	4.990 Diamonds	RNDM4990	Ragnarok X Next Generation	140727	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RNDM	0	4.00	hybrid
2436	51.370 Diamonds	RNDM51K3	Ragnarok X Next Generation	1398273	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RNDM	0	4.00	hybrid
2437	Assurance of Exclusivity	RNPPAOE	Ragnarok X Next Generation	331979	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RNPP	0	4.00	hybrid
2438	Hadiah Privilege W	RNPPHPW	Ragnarok X Next Generation	195745	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RNPP	0	4.00	hybrid
2439	Oath of Bond	RNPPOAB	Ragnarok X Next Generation	538950	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RNPP	0	4.00	hybrid
2440	198 BitGold	SCBG198	Snowbreak Containment Zone	414588	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	SCBG	0	4.00	hybrid
2441	30 BitGold	SCBG30	Snowbreak Containment Zone	69212	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	SCBG	0	4.00	hybrid
2442	328 BitGold	SCBG328	Snowbreak Containment Zone	690889	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	SCBG	0	4.00	hybrid
2443	6 BitGold	SCBG6	Snowbreak Containment Zone	14815	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	SCBG	0	4.00	hybrid
2444	648 BitGold	SCBG648	Snowbreak Containment Zone	1381641	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	SCBG	0	4.00	hybrid
2445	98 BitGold	SCBG98	Snowbreak Containment Zone	215997	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	SCBG	0	4.00	hybrid
2446	112 Diamonds	SDDD112	Speed Drifters	19750	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
1517	132.000 (120.000+12.000) Cash Pack	DCCP120K	Dragon Nest M Classic	2640225	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:47.60383	DCCP	0	4.00	hybrid
1518	12.800 (12.000+800) Cash Pack	DCCP12K	Dragon Nest M Classic	265500	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:47.60383	DCCP	0	4.00	hybrid
1519	19.500 (18.000+1.500) Cash Pack	DCCP18K	Dragon Nest M Classic	395600	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:47.60383	DCCP	0	4.00	hybrid
1520	32.900 (30.000+2.900) Cash Pack	DCCP30K	Dragon Nest M Classic	648800	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:47.60383	DCCP	0	4.00	hybrid
1521	3.130 (3.000+130) Cash Pack	DCCP3K	Dragon Nest M Classic	65100	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:47.60383	DCCP	0	4.00	hybrid
1522	626 (600+26) Cash Pack	DCCP600	Dragon Nest M Classic	12550	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:47.60383	DCCP	0	4.00	hybrid
1523	66.000 (60.000+6.000) Cash Pack	DCCP60K	Dragon Nest M Classic	1295500	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:47.60383	DCCP	0	4.00	hybrid
1524	6.366 (6.000+366) Cash Pack	DCCP6K	Dragon Nest M Classic	131950	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:47.60383	DCCP	0	4.00	hybrid
1525	1.499 + 224 Voucher	DHVO1499	Dynasty Heroes Samkok Legend	215600	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	DHVO	0	4.00	hybrid
1526	1.799 + 269 Voucher	DHVO1799	Dynasty Heroes Samkok Legend	258600	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	DHVO	0	4.00	hybrid
1527	199 + 29 Voucher	DHVO199	Dynasty Heroes Samkok Legend	28700	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	DHVO	0	4.00	hybrid
1528	299 + 44 Voucher	DHVO299	Dynasty Heroes Samkok Legend	43200	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	DHVO	0	4.00	hybrid
1529	2.999 + 449 Voucher	DHVO2999	Dynasty Heroes Samkok Legend	431000	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	DHVO	0	4.00	hybrid
1530	4.699 + 704 Voucher	DHVO4699	Dynasty Heroes Samkok Legend	675400	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	DHVO	0	4.00	hybrid
1531	499 + 74 Voucher	DHVO499	Dynasty Heroes Samkok Legend	71800	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	DHVO	0	4.00	hybrid
1532	7.499 + 1124 Voucher	DHVO7499	Dynasty Heroes Samkok Legend	1077600	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	DHVO	0	4.00	hybrid
1533	99 + 14 Voucher	DHVO99	Dynasty Heroes Samkok Legend	14500	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	DHVO	0	4.00	hybrid
2447	1.230 Diamonds	SDDD1230	Speed Drifters	197500	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2448	1.845 Diamonds	SDDD1845	Speed Drifters	291000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2449	282 Diamonds	SDDD282	Speed Drifters	48900	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2450	3.134 Diamonds	SDDD3134	Speed Drifters	489500	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2451	56 Diamonds	SDDD56	Speed Drifters	9990	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2452	579 Diamonds	SDDD579	Speed Drifters	98250	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2453	6.279 Diamonds	SDDD6279	Speed Drifters	985000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2763	150 Ruby	SERU150	SEAL M SEA	17800	\N	\N	f	f	2025-11-10 09:44:56.355911	2025-11-10 09:44:56.355911	SERU	0	4.00	hybrid
2456	1.300 Ruby	SERU1300	SEAL M SEA	127000	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SERU	0	4.00	hybrid
2457	13.600 Ruby	SERU13K6	SEAL M SEA	1265000	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SERU	0	4.00	hybrid
2458	1.580 Ruby	SERU1580	SEAL M SEA	173500	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SERU	0	4.00	hybrid
2459	17.500 Ruby	SERU17K5	SEAL M SEA	1728000	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SERU	0	4.00	hybrid
2460	250 Ruby	SERU250	SEAL M SEA	25700	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SERU	0	4.00	hybrid
2461	2.650 Ruby	SERU2650	SEAL M SEA	253500	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SERU	0	4.00	hybrid
2462	310 Ruby	SERU310	SEAL M SEA	35100	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SERU	0	4.00	hybrid
2463	3.250 Ruby	SERU3250	SEAL M SEA	346100	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SERU	0	4.00	hybrid
2464	5.375 Ruby	SERU5375	SEAL M SEA	506200	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SERU	0	4.00	hybrid
2465	775 Ruby	SERU775	SEAL M SEA	76500	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SERU	0	4.00	hybrid
2466	1 Voucher 	SLVO1	Soul Land New World	14510	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SLVO	0	4.00	hybrid
2467	100 Voucher 	SLVO100	Soul Land New World	1371525	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SLVO	0	4.00	hybrid
2468	15 Voucher 	SLVO15	Soul Land New World	212909	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SLVO	0	4.00	hybrid
2469	30 Voucher	SLVO30	Soul Land New World	411725	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SLVO	0	4.00	hybrid
2470	5 Voucher 	SLVO5	Soul Land New World	70525	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SLVO	0	4.00	hybrid
2471	50 Voucher	SLVO50	Soul Land New World	699625	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SLVO	0	4.00	hybrid
2159	Isi Ulang Pulsa Smartfren 65.000	SM65	Sausage Man	64300	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2160	Isi Ulang Pulsa Smartfren 7.000	SM7	Sausage Man	7000	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2161	Isi Ulang Pulsa Smartfren 70.000	SM70	Sausage Man	69400	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2162	Isi Ulang Pulsa Smartfren 75.000	SM75	Sausage Man	73950	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2163	Isi Ulang Pulsa Smartfren 8.000	SM8	Sausage Man	8000	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2164	Isi Ulang Pulsa Smartfren 80.000	SM80	Sausage Man	79297	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2165	Isi Ulang Pulsa Smartfren 85.000	SM85	Sausage Man	83950	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2166	Isi Ulang Pulsa Smartfren 9.000	SM9	Sausage Man	9000	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2167	Isi Ulang Pulsa Smartfren 90.000	SM90	Sausage Man	89600	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2168	Isi Ulang Pulsa Smartfren 95.000	SM95	Sausage Man	93900	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2472	1.378 Candy	SMCN1378	Sausage Man	255300	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2473	186 Candy	SMCN186	Sausage Man	38225	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2474	2.118 Candy	SMCN2118	Sausage Man	367200	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2475	318 Candy	SMCN318	Sausage Man	64200	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2476	3.548 Candy	SMCN3548	Sausage Man	635900	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2477	61 Candy	SMCN61	Sausage Man	13000	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2478	686 Candy	SMCN686	Sausage Man	123600	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2479	7.108 Candy	SMCN7108	Sausage Man	1270500	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2480	100 Diamonds	SSDD100	State of Survival Zombie War	16797	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SSDD	0	4.00	hybrid
2481	10.000 Diamonds	SSDD10K	State of Survival Zombie War	1454394	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SSDD	0	4.00	hybrid
2482	1.000 Diamonds	SSDD1K	State of Survival Zombie War	147172	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SSDD	0	4.00	hybrid
2483	20.000 Diamonds	SSDD20K	State of Survival Zombie War	2859824	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SSDD	0	4.00	hybrid
2484	2.000 Diamonds	SSDD2K	State of Survival Zombie War	304720	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SSDD	0	4.00	hybrid
2485	500 Diamonds	SSDD500	State of Survival Zombie War	77112	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SSDD	0	4.00	hybrid
2486	5.000 Diamonds	SSDD5K	State of Survival Zombie War	826716	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SSDD	0	4.00	hybrid
2487	100 Golder Star	SUGS100	Super SUS	11285	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SUGS	0	4.00	hybrid
2488	1.060 Golder Star	SUGS1060	Super SUS	104135	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SUGS	0	4.00	hybrid
2489	2.180 Golder Star	SUGS2180	Super SUS	207411	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SUGS	0	4.00	hybrid
2490	310 Golder Star	SUGS310	Super SUS	33175	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SUGS	0	4.00	hybrid
2491	520 Golder Star	SUGS520	Super SUS	55300	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SUGS	0	4.00	hybrid
2746	Voucher IDR 50.000 (210 Coins)	TCIDR210	TikTok Coin	49500	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	TCIDR	0	4.00	hybrid
2747	Voucher IDR 100.000 (400 Coins)	TCIDR400	TikTok Coin	99000	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	TCIDR	0	4.00	hybrid
2748	Voucher IDR 1.000.000 (4.100 Coins)	TCIDR4100	TikTok Coin	990000	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	TCIDR	0	4.00	hybrid
2749	Voucher IDR 20.000 (80 Coins)	TCIDR80	TikTok Coin	20000	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	TCIDR	0	4.00	hybrid
2750	Voucher IDR 200.000 (800 Coins)	TCIDR800	TikTok Coin	198000	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	TCIDR	0	4.00	hybrid
2512	60 Diamond	TJDD60	Tom and Jerry Chase	15050	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TJDD	0	4.00	hybrid
2513	600 Diamond	TJDD600	Tom and Jerry Chase	137935	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TJDD	0	4.00	hybrid
2514	6000 Diamond	TJDD6000	Tom and Jerry Chase	1376090	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TJDD	0	4.00	hybrid
2515	117 Crystall	TLCK117	The Legend of Neverland	18000	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TLCK	0	4.00	hybrid
2516	1701 Crystall	TLCK1701	The Legend of Neverland	261000	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TLCK	0	4.00	hybrid
2517	279 Crystall	TLCK279	The Legend of Neverland	44000	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TLCK	0	4.00	hybrid
2518	2826 Crystall	TLCK2826	The Legend of Neverland	435000	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TLCK	0	4.00	hybrid
2519	4248 Crystall	TLCK4248	The Legend of Neverland	652000	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TLCK	0	4.00	hybrid
2520	567 Crystall	TLCK567	The Legend of Neverland	87000	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TLCK	0	4.00	hybrid
2521	846 Crystall	TLCK846	The Legend of Neverland	13100	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TLCK	0	4.00	hybrid
2522	8487 Crystall	TLCK8487	The Legend of Neverland	1303000	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TLCK	0	4.00	hybrid
2523	Berkat Bulan + 117 Crystall	TLPPBB1	The Legend of Neverland	87000	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TLPP	0	4.00	hybrid
2524	Berkat Bulan + 396 Crystall	TLPPBB2	The Legend of Neverland	131000	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TLPP	0	4.00	hybrid
2525	Star Protection + 9 Crystall	TLPPSP1	The Legend of Neverland	43500	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TLPP	0	4.00	hybrid
2526	Star Protection + 576 Crystall	TLPPSP2	The Legend of Neverland	131000	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TLPP	0	4.00	hybrid
2527	1200 Sycee	TRSY1200	Tamashi Rise of Yokai	0	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TRSY	0	4.00	hybrid
2528	1800 Sycee	TRSY1800	Tamashi Rise of Yokai	0	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TRSY	0	4.00	hybrid
2529	300 Sycee	TRSY300	Tamashi Rise of Yokai	0	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TRSY	0	4.00	hybrid
2530	3000 Sycee	TRSY3000	Tamashi Rise of Yokai	0	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TRSY	0	4.00	hybrid
2531	60 Sycee	TRSY60	Tamashi Rise of Yokai	0	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TRSY	0	4.00	hybrid
2532	600 Sycee	TRSY600	Tamashi Rise of Yokai	0	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TRSY	0	4.00	hybrid
2533	6000 Sycee	TRSY6000	Tamashi Rise of Yokai	0	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TRSY	0	4.00	hybrid
2534	900 Sycee	TRSY900	Tamashi Rise of Yokai	0	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TRSY	0	4.00	hybrid
2535	13500 TFT Coins	TTID13500	Teamfight Tactics Mobile	1115598	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TTID	0	4.00	hybrid
2536	1380 TFT Coins	TTID1380	Teamfight Tactics Mobile	131036	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TTID	0	4.00	hybrid
2537	2800 TFT Coins	TTID2800	Teamfight Tactics Mobile	261073	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TTID	0	4.00	hybrid
2538	4500 TFT Coins 	TTID4500	Teamfight Tactics Mobile	409686	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TTID	0	4.00	hybrid
2539	575 TFT Coins 	TTID575	Teamfight Tactics Mobile	56730	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TTID	0	4.00	hybrid
2540	6500 TFT Coins	TTID6500	Teamfight Tactics Mobile	576876	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TTID	0	4.00	hybrid
2541	100 Coin	TUAC100	The Ants Underground Kingdom	15205	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TUAC	0	4.00	hybrid
2542	1.000 Coin	TUAC1000	The Ants Underground Kingdom	147012	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TUAC	0	4.00	hybrid
2543	10.000 Coin	TUAC10K	The Ants Underground Kingdom	1460268	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TUAC	0	4.00	hybrid
2544	1.500 Coin	TUAC1500	The Ants Underground Kingdom	233021	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TUAC	0	4.00	hybrid
2545	2.000 Coin	TUAC2000	The Ants Underground Kingdom	305013	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TUAC	0	4.00	hybrid
2546	22 Coin	TUAC22	The Ants Underground Kingdom	3989	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TUAC	0	4.00	hybrid
2547	2.500 Coin	TUAC2500	The Ants Underground Kingdom	373020	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TUAC	0	4.00	hybrid
2548	3.000 Coin	TUAC3000	The Ants Underground Kingdom	475299	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TUAC	0	4.00	hybrid
2549	500 Coin	TUAC500	The Ants Underground Kingdom	73308	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TUAC	0	4.00	hybrid
2550	5.000 Coin	TUAC5000	The Ants Underground Kingdom	733479	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TUAC	0	4.00	hybrid
2551	Dana Elit (REBATE LV 80)	UDMMDE	UNDAWN	0	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:11.596602	UDMM	0	4.00	hybrid
2552	Glory Pass Premium	UDMMGPP	UNDAWN	0	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:11.596602	UDMM	0	4.00	hybrid
2553	Kartu Bulanan	UDMMKB	UNDAWN	0	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:11.596602	UDMM	0	4.00	hybrid
2554	Kartu Mingguan	UDMMKM	UNDAWN	0	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:11.596602	UDMM	0	4.00	hybrid
2555	RC x 1.850	UDRC1850	UNDAWN	0	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:11.596602	UDRC	0	4.00	hybrid
2556	RC x 250	UDRC250	UNDAWN	0	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:11.596602	UDRC	0	4.00	hybrid
2557	RC x 2.800	UDRC2800	UNDAWN	0	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:11.596602	UDRC	0	4.00	hybrid
2558	RC x 33.000 	UDRC33000	UNDAWN	0	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:11.596602	UDRC	0	4.00	hybrid
2559	RC x 450	UDRC450	UNDAWN	0	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:11.596602	UDRC	0	4.00	hybrid
2560	RC x 4.750	UDRC4750	UNDAWN	0	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:11.596602	UDRC	0	4.00	hybrid
2561	RC x 66.500	UDRC66500	UNDAWN	0	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:11.596602	UDRC	0	4.00	hybrid
2562	RC x 80	UDRC80	UNDAWN	0	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:11.596602	UDRC	0	4.00	hybrid
2563	RC x 920	UDRC920	UNDAWN	0	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:11.596602	UDRC	0	4.00	hybrid
2564	RC x 9.600	UDRC9600	UNDAWN	0	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:11.596602	UDRC	0	4.00	hybrid
2764	Voucher XBOX $5	XBUSD5	XBOX	83250	\N	\N	f	f	2025-11-10 09:45:17.852736	2025-11-10 09:45:17.852736	XBUSD	0	4.00	hybrid
2586	196 Zems 	ZPZM196	Zepeto	162685	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPZM	0	4.00	hybrid
2587	28 Zems	ZPZM28	Zepeto	28475	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPZM	0	4.00	hybrid
2588	323 Zems 	ZPZM323	Zepeto	297815	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPZM	0	4.00	hybrid
2589	58 Zems	ZPZM58	Zepeto	56092	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPZM	0	4.00	hybrid
2590	770 Zems 	ZPZM770	Zepeto	607693	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPZM	0	4.00	hybrid
2591	Inter-Knot Membership	ZZIKIK1	Zenless Zone Zero	59900	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZIK	0	4.00	hybrid
2592	Inter-knot Membership x2	ZZIKIK2	Zenless Zone Zero	119500	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZIK	0	4.00	hybrid
2593	Inter-knot Membership x3	ZZIKIK3	Zenless Zone Zero	178700	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZIK	0	4.00	hybrid
2594	Inter-Knot Membership x4	ZZIKIK4	Zenless Zone Zero	247500	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZIK	0	4.00	hybrid
2595	Inter-Knot Membership x5	ZZIKIK5	Zenless Zone Zero	309000	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZIK	0	4.00	hybrid
2596	1980 + 260 Monochrome	ZZMC1980	Zenless Zone Zero	395500	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZMC	0	4.00	hybrid
2597	300 + 30 Monochrome	ZZMC300	Zenless Zone Zero	59900	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZMC	0	4.00	hybrid
2598	3280 + 600 Monochrome	ZZMC3280	Zenless Zone Zero	624500	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZMC	0	4.00	hybrid
2599	60 Monochrome	ZZMC60	Zenless Zone Zero	16000	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZMC	0	4.00	hybrid
2600	6480 + 1600 Monochrome	ZZMC6480	Zenless Zone Zero	1234800	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZMC	0	4.00	hybrid
2601	6480+1600 Monochrome x2	ZZMC6480X2	Zenless Zone Zero	2475100	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZMC	0	4.00	hybrid
2602	6480+1600 Monochrome x3	ZZMC6480X3	Zenless Zone Zero	3712100	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZMC	0	4.00	hybrid
2603	6480+1600 Monochrome x4	ZZMC6480X4	Zenless Zone Zero	4950000	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZMC	0	4.00	hybrid
2604	6480+1600 Monochrome x5	ZZMC6480X5	Zenless Zone Zero	6190000	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZMC	0	4.00	hybrid
2605	980 + 110 Monochrome	ZZMC980	Zenless Zone Zero	180500	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZMC	0	4.00	hybrid
2606	All Pack Monochrome	ZZMCALL	Zenless Zone Zero	2517300	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZZMC	0	4.00	hybrid
2187	1.980 Crystals+360 Diamonds	LDCR1980	Love and Deepspace	442690	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-16 06:53:29.726341	LDCR	0	4.00	hybrid
2188	300 Crystals+30 Diamonds	LDCR300	Love and Deepspace	70995	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-16 06:53:29.726341	LDCR	0	4.00	hybrid
2189	3.280 Crystals + 720 Diamond	LDCR3280	Love and Deepspace	708810	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-16 06:53:29.726341	LDCR	0	4.00	hybrid
2190	450 Crystals+90 Diamonds	LDCR450	Love and Deepspace	99430	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-16 06:53:29.726341	LDCR	0	4.00	hybrid
2191	60 Crystals	LDCR60	Love and Deepspace	14125	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-16 06:53:29.726341	LDCR	0	4.00	hybrid
2192	6480 Crystals+1600 Diamonds	LDCR6480	Love and Deepspace	1421600	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-16 06:53:29.726341	LDCR	0	4.00	hybrid
2193	980 Crystals+150 Diamonds	LDCR980	Love and Deepspace	220930	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-16 06:53:29.726341	LDCR	0	4.00	hybrid
2194	Aurum Pass (30 Days)	LDPPAP	Love and Deepspace	70995	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-16 06:53:29.726341	LDPP	0	4.00	hybrid
2195	Companionship Pack	LDPPCP	Love and Deepspace	265280	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-16 06:53:29.726341	LDPP	0	4.00	hybrid
1654	635 Diamond	FFID635	FREE FIRE	73500	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1655	645 Diamond	FFID645	FREE FIRE	75042	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1656	6.480 Diamond	FFID6480	FREE FIRE	733650	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1657	655 Diamond	FFID655	FREE FIRE	76584	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1870	1280+140 Oneiric Shard	HSOS1280	Honkai Star Rail	222290	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-16 08:22:41.762832	HSOS	0	4.00	hybrid
1871	1.980 + 260 Oneiric Shard	HSOS1980	Honkai Star Rail	341495	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-16 08:22:41.762832	HSOS	0	4.00	hybrid
1872	300 + 30 Oneiric Shard	HSOS300	Honkai Star Rail	54620	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-16 08:22:41.762832	HSOS	0	4.00	hybrid
1873	3.280 + 600 Oneiric Shard	HSOS3280	Honkai Star Rail	557470	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-16 08:22:41.762832	HSOS	0	4.00	hybrid
1875	60 Oneiric Shard	HSOS60	Honkai Star Rail	11385	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-16 08:22:41.762832	HSOS	0	4.00	hybrid
1876	6.480 + 1.600 Oneiric Shard	HSOS6480	Honkai Star Rail	1080640	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-16 08:22:41.762832	HSOS	0	4.00	hybrid
1877	980 + 110 Oneiric Shard	HSOS980	Honkai Star Rail	168015	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-16 08:22:41.762832	HSOS	0	4.00	hybrid
1878	Express Supply Pass	HSPGE	Honkai Star Rail	55990	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-16 08:22:41.762832	HSPG	0	4.00	hybrid
1879	Express Supply Pass X2	HSPGEX2	Honkai Star Rail	107900	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-16 08:22:41.762832	HSPG	0	4.00	hybrid
1880	Express Supply Pass X3	HSPGEX3	Honkai Star Rail	161825	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-16 08:22:41.762832	HSPG	0	4.00	hybrid
1881	Express Supply Pass X4	HSPGEX4	Honkai Star Rail	215745	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-16 08:22:41.762832	HSPG	0	4.00	hybrid
1882	Express Supply Pass X5	HSPGEX5	Honkai Star Rail	269670	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-16 08:22:41.762832	HSPG	0	4.00	hybrid
1779	Chest O Gems	GWMSCOG	GROWTOPIA	27200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GWMS	0	4.00	hybrid
1785	10.000 Paid Quartz	HBPQ10K	Heaven Burns Red	998000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HBPQ	0	4.00	hybrid
1786	130 Paid Quartz	HBPQ130	Heaven Burns Red	17200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HBPQ	0	4.00	hybrid
1787	1.370 Paid Quartz	HBPQ1370	Heaven Burns Red	157000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HBPQ	0	4.00	hybrid
1788	2.720 Paid Quartz	HBPQ2720	Heaven Burns Red	285200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HBPQ	0	4.00	hybrid
1789	410 Paid Quartz	HBPQ410	Heaven Burns Red	50000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HBPQ	0	4.00	hybrid
1790	4.750 Paid Quartz	HBPQ4750	Heaven Burns Red	485000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HBPQ	0	4.00	hybrid
1791	870 Paid Quartz	HBPQ870	Heaven Burns Red	100000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HBPQ	0	4.00	hybrid
1792	First Cheer Special Offer	HFPCFCSO	HAIKYU FLY HIGH	99000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFPC	0	4.00	hybrid
1793	First Growth Special Offer	HFPCFGSO	HAIKYU FLY HIGH	423250	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFPC	0	4.00	hybrid
1794	First Memory Special Offer	HFPCFMSO	HAIKYU FLY HIGH	352600	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFPC	0	4.00	hybrid
1795	Level Up Bonuses	HFPCLU	HAIKYU FLY HIGH	141250	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFPC	0	4.00	hybrid
1796	Stamina Boost Pack 1	HFPCSB1	HAIKYU FLY HIGH	28500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFPC	0	4.00	hybrid
1797	Stamina Boost Pack 2	HFPCSB2	HAIKYU FLY HIGH	70500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFPC	0	4.00	hybrid
1798	Starter Only Pack	HFPCSOP	HAIKYU FLY HIGH	14250	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFPC	0	4.00	hybrid
1799	Memory Recruit Special 1	HFRCM1	HAIKYU FLY HIGH	14200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1800	Memory Recruit Special 2	HFRCM2	HAIKYU FLY HIGH	70600	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1819	1.980 Star Gems	HFSG1980	HAIKYU FLY HIGH	470000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFSG	0	4.00	hybrid
1910	Diamond Weekly Card (Package)	KCPCDWC	Kings Choice	31800	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	KCPC	0	4.00	hybrid
1911	Lunar Blessing (Package)	KCPCLB	Kings Choice	125200	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	KCPC	0	4.00	hybrid
1912	Monthly Card (Package)	KCPCMC	Kings Choice	31800	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	KCPC	0	4.00	hybrid
1913	Weekly Card (Package) 	KCPCWC	Kings Choice	7000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	KCPC	0	4.00	hybrid
1914	Yearly Card (Package)	KCPCYC	Kings Choice	296000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	KCPC	0	4.00	hybrid
1915	Top Up Link Aja 10.000	LA10	LifeAfter	10325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1916	Top Up Link Aja 100.000	LA100	LifeAfter	100325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1917	Top Up Link Aja 15.000	LA15	LifeAfter	15325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1918	Top Up Link Aja 150.000	LA150	LifeAfter	150325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1919	Top Up Link Aja 20.000	LA20	LifeAfter	20325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1920	Top Up Link Aja 200.000	LA200	LifeAfter	200325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1921	Top Up Link Aja 25.000	LA25	LifeAfter	25325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1922	Top Up Link Aja 250.000	LA250	LifeAfter	250325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1923	Top Up Link Aja 30.000	LA30	LifeAfter	30325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1924	Top Up Link Aja 300.000 	LA300	LifeAfter	300325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
2011	1.050 Diamonds (937 + 113 Bonus)	MLBR1050	MOBILE LEGENDS	240225	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2012	1.220 Diamonds (1093 + 127 Bonus)	MLBR1220	MOBILE LEGENDS	282500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2013	1.412 Diamonds (1250 + 162 Bonus)	MLBR1412	MOBILE LEGENDS	322900	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2014	1.669 Diamonds (1484 + 185 Bonus)	MLBR1669	MOBILE LEGENDS	382900	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2015	156 + 16 Diamond 	MLBR172	MOBILE LEGENDS	40200	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2016	2.195 Diamonds (1860 + 335 Bonus)	MLBR2195	MOBILE LEGENDS	480700	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2017	234 + 23 Diamond	MLBR257	MOBILE LEGENDS	60200	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2018	2.901 Diamonds (2485 + 416 Bonus)	MLBR2901	MOBILE LEGENDS	642900	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2019	3.073 Diamonds (2641 + 432 Bonus)	MLBR3073	MOBILE LEGENDS	692500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2020	312 + 32 Diamond	MLBR344	MOBILE LEGENDS	80300	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2073	546 + 54 Diamond 	MLID600	MOBILE LEGENDS	155225	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLID	0	4.00	hybrid
2074	61 + 6 Diamond 	MLID67	MOBILE LEGENDS	18550	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLID	0	4.00	hybrid
2075	64 + 6 Diamond 	MLID70	MOBILE LEGENDS	19200	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLID	0	4.00	hybrid
2076	625 + 81 Diamond 	MLID706	MOBILE LEGENDS	179800	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLID	0	4.00	hybrid
2077	643 + 72 Diamond 	MLID715	MOBILE LEGENDS	189500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLID	0	4.00	hybrid
2078	658 + 80 Diamond 	MLID738	MOBILE LEGENDS	190500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLID	0	4.00	hybrid
2079	70 + 5 Diamond 	MLID75	MOBILE LEGENDS	20300	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLID	0	4.00	hybrid
2080	683 + 77 Diamond 	MLID760	MOBILE LEGENDS	195500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLID	0	4.00	hybrid
2081	8 Diamond	MLID8	MOBILE LEGENDS	2800	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLID	0	4.00	hybrid
2082	77 + 8 Diamond 	MLID85	MOBILE LEGENDS	23872	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLID	0	4.00	hybrid
2083	781 + 97 Diamond 	MLID878	MOBILE LEGENDS	223000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLID	0	4.00	hybrid
2127	6GB + 10GB MD + 6GB CHAT 30HR	SD10	Speed Drifters	26300	\N	\N	t	f	2025-10-28 15:28:11.713068	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2128	120GB = 40GB (24JAM) + 80GB (mlm) 28Hr	SD120	Speed Drifters	198215	\N	\N	t	f	2025-10-28 15:28:11.713068	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2129	Kuota Malam 12 GB (01.00-05.00) 30Hr	SD123	Speed Drifters	21200	\N	\N	t	f	2025-10-28 15:28:11.713068	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2130	Kuota Malam 12 GB (01.00-05.00) 7Hr	SD127	Speed Drifters	10800	\N	\N	t	f	2025-10-28 15:28:11.713068	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2131	1GB + 2GB MD + 1GB CHAT 3HR	SD2	Speed Drifters	7200	\N	\N	t	f	2025-10-28 15:28:11.713068	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2132	30GB = 10GB (24JAM) + 20GB (mlm) 28Hr	SD30	Speed Drifters	63675	\N	\N	t	f	2025-10-28 15:28:11.713068	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2133	2GB + 2GB MD + 2GB CHAT 7HR	SD4	Speed Drifters	12475	\N	\N	t	f	2025-10-28 15:28:11.713068	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2134	3GB + 5GB MD + 3GB CHAT 30HR	SD6	Speed Drifters	19500	\N	\N	t	f	2025-10-28 15:28:11.713068	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2135	60GB = 20GB (24JAM) + 40GB (mlm) 28Hr	SD60	Speed Drifters	105900	\N	\N	t	f	2025-10-28 15:28:11.713068	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2136	90GB = 30GB (24JAM) + 60GB (mlm) 28Hr	SD90	Speed Drifters	133715	\N	\N	t	f	2025-10-28 15:28:11.713068	2025-11-10 09:44:47.421983	SDDD	0	4.00	hybrid
2138	Isi Ulang Pulsa Smartfren 10.000	SM10	Sausage Man	10000	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2139	Isi Ulang Pulsa Smartfren 100.000	SM100	Sausage Man	99000	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2140	Isi Ulang Pulsa Smartfren 11.000	SM11	Sausage Man	11218	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2141	Isi Ulang Pulsa Smartfren 12.000	SM12	Sausage Man	11950	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2142	Isi Ulang Pulsa Smartfren 15.000	SM15	Sausage Man	14900	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2143	Isi Ulang Pulsa Smartfren 150.000	SM150	Sausage Man	148000	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2144	Isi Ulang Pulsa Smartfren 2.000	SM2	Sausage Man	2000	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2145	Isi Ulang Pulsa Smartfren 20.000	SM20	Sausage Man	19950	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2146	Isi Ulang Pulsa Smartfren 200.000	SM200	Sausage Man	197200	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2147	Isi Ulang Pulsa Smartfren 25.000	SM25	Sausage Man	24750	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2148	Isi Ulang Pulsa Smartfren 3.000	SM3	Sausage Man	2980	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2149	Isi Ulang Pulsa Smartfren 30.000	SM30	Sausage Man	29950	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2150	Isi Ulang Pulsa Smartfren 35.000	SM35	Sausage Man	34700	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2151	Isi Ulang Pulsa Smartfren 4.000	SM4	Sausage Man	4000	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2152	Isi Ulang Pulsa Smartfren 40.000	SM40	Sausage Man	39700	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2153	Isi Ulang Pulsa Smartfren 45.000 	SM45	Sausage Man	44700	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2154	Isi Ulang Pulsa Smartfren 5.000	SM5	Sausage Man	4970	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2155	Isi Ulang Pulsa Smartfren 50.000	SM50	Sausage Man	49400	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2156	Isi Ulang Pulsa Smartfren 55.000	SM55	Sausage Man	54700	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2157	Isi Ulang Pulsa Smartfren 6.000	SM6	Sausage Man	6000	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2158	Isi Ulang Pulsa Smartfren 60.000	SM60	Sausage Man	60050	\N	\N	t	f	2025-10-28 15:28:17.731349	2025-11-10 09:44:56.355911	SMCN	0	4.00	hybrid
2218	2.980 Crystals	LTCY2980	Light of Thel New Era	407500	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	LTCY	0	4.00	hybrid
2219	450 Crystals	LTCY450	Light of Thel New Era	62200	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	LTCY	0	4.00	hybrid
2220	4.500 Crystals	LTCY4500	Light of Thel New Era	614500	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	LTCY	0	4.00	hybrid
2221	630 Crystals	LTCY630	Light of Thel New Era	87000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	LTCY	0	4.00	hybrid
2222	6.300 Crystals	LTCY6300	Light of Thel New Era	860700	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	LTCY	0	4.00	hybrid
2223	90 Crystals	LTCY90	Light of Thel New Era	13000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	LTCY	0	4.00	hybrid
2224	900 Crystals	LTCY900	Light of Thel New Era	124000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	LTCY	0	4.00	hybrid
2225	9.000 Crystals	LTCY9000	Light of Thel New Era	1230500	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	LTCY	0	4.00	hybrid
2226	12 Diamonds (11 + 1 Bonus)	MCIDD12	Magic Chess Go Go	3932	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDD	0	4.00	hybrid
2227	170 Diamonds (154 + 16 Bonus)	MCIDD170	Magic Chess Go Go	43165	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDD	0	4.00	hybrid
2228	19 Diamonds (17 + 2 Bonus)	MCIDD19	Magic Chess Go Go	5647	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDD	0	4.00	hybrid
2229	2.010 Diamonds (1708 + 302 Bonus)	MCIDD2010	Magic Chess Go Go	465523	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDD	0	4.00	hybrid
2230	240 Diamonds (217 + 23 Bonus)	MCIDD240	Magic Chess Go Go	61061	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDD	0	4.00	hybrid
2231	28 Diamonds (25 + 3 Bonus)	MCIDD28	Magic Chess Go Go	8078	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDD	0	4.00	hybrid
2232	296 Diamonds (256 + 40 Bonus)	MCIDD296	Magic Chess Go Go	74803	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDD	0	4.00	hybrid
2233	408 Diamonds (367 + 41 Bonus)	MCIDD408	Magic Chess Go Go	107411	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDD	0	4.00	hybrid
2234	44 Diamonds (40 + 4 Bonus)	MCIDD44	Magic Chess Go Go	11738	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDD	0	4.00	hybrid
2235	4.830 Diamonds (4003 + 827 Bonus)	MCIDD4830	Magic Chess Go Go	1112500	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDD	0	4.00	hybrid
2236	5 Diamonds	MCIDD5	Magic Chess Go Go	1900	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDD	0	4.00	hybrid
2237	568 Diamonds (503 + 65 Bonus)	MCIDD568	Magic Chess Go Go	139448	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDD	0	4.00	hybrid
2238	59 Diamonds (53 + 6 Bonus)	MCIDD59	Magic Chess Go Go	15185	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDD	0	4.00	hybrid
2239	85 Diamonds (77 + 8 Bonus)	MCIDD85	Magic Chess Go Go	21680	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDD	0	4.00	hybrid
2240	875 Diamonds (774 + 101 Bonus)	MCIDD875	Magic Chess Go Go	212480	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDD	0	4.00	hybrid
2241	100 Diamonds (50+50)	MCIDF100	Magic Chess Go Go	12500	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDF	0	4.00	hybrid
2242	11000 Diamonds (500+500)	MCIDF1K	Magic Chess Go Go	123000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDF	0	4.00	hybrid
2455	123 Ruby	SERU123	SEAL M SEA	13100	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SERU	0	4.00	hybrid
2311	Twilight Pass Region MY	MLMSYTP	MOBILE LEGENDS	176000	\N	\N	t	f	2025-10-29 19:58:54.090363	2025-11-10 09:44:33.292695	MLMS	0	4.00	hybrid
2312	100 IC	NIIC100	NBA INFINITE	13621	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	NIIC	0	4.00	hybrid
2313	1.000 IC	NIIC1000	NBA INFINITE	130893	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	NIIC	0	4.00	hybrid
2314	10.000 IC	NIIC10000	NBA INFINITE	1304427	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	NIIC	0	4.00	hybrid
2315	200 IC	NIIC200	NBA INFINITE	29500	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	NIIC	0	4.00	hybrid
2316	2.000 IC	NIIC2000	NBA INFINITE	253905	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	NIIC	0	4.00	hybrid
2317	3.000 IC	NIIC3000	NBA INFINITE	385118	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	NIIC	0	4.00	hybrid
2318	500 IC	NIIC500	NBA INFINITE	64466	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	NIIC	0	4.00	hybrid
2319	5.000 IC	NIIC5000	NBA INFINITE	648363	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	NIIC	0	4.00	hybrid
2320	1.280 Jade	OAJA1280	Onmyoji Arena	237000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	OAJA	0	4.00	hybrid
2321	300 Jade	OAJA300	Onmyoji Arena	6000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	OAJA	0	4.00	hybrid
2322	3.280 Jade	OAJA3280	Onmyoji Arena	590000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	OAJA	0	4.00	hybrid
2323	60 Jade	OAJA60	Onmyoji Arena	12800	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	OAJA	0	4.00	hybrid
2333	Battle Pass Deluxe	OHPPBD	Once Human	359000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	OHPP	0	4.00	hybrid
2334	Meta Pass 30 Days	OHPPMP	Once Human	75000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	OHPP	0	4.00	hybrid
2335	107 Coupon	OPKP107	ONE PUNCH MAN The Strongest	170000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	OPKP	0	4.00	hybrid
2336	13 Coupon	OPKP13	ONE PUNCH MAN The Strongest	22500	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	OPKP	0	4.00	hybrid
2337	214 Coupon	OPKP214	ONE PUNCH MAN The Strongest	335000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	OPKP	0	4.00	hybrid
2338	22 Coupon	OPKP22	ONE PUNCH MAN The Strongest	33600	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	OPKP	0	4.00	hybrid
2339	227 Coupon	OPKP227	ONE PUNCH MAN The Strongest	420000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	OPKP	0	4.00	hybrid
2340	23 Coupon	OPKP23	ONE PUNCH MAN The Strongest	42000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	OPKP	0	4.00	hybrid
2341	321 Coupon	OPKP321	ONE PUNCH MAN The Strongest	505000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	OPKP	0	4.00	hybrid
2342	5 Coupon	OPKP5	ONE PUNCH MAN The Strongest	8500	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	OPKP	0	4.00	hybrid
2343	54 Coupon	OPKP54	ONE PUNCH MAN The Strongest	85000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	OPKP	0	4.00	hybrid
2344	6 Coupon	OPKP6	ONE PUNCH MAN The Strongest	8500	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	OPKP	0	4.00	hybrid
2345	61 Coupon	OPKP61	ONE PUNCH MAN The Strongest	112000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	OPKP	0	4.00	hybrid
2346	91 Coupon	OPKP91	ONE PUNCH MAN The Strongest	170000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	OPKP	0	4.00	hybrid
2347	Black Key VIP (30 Days)	PNPPBKV30	Path to Nowhere	73200	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNPP	0	4.00	hybrid
2348	Chief Inauguration Special I	PNPPCIS1	Path to Nowhere	15700	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNPP	0	4.00	hybrid
2349	Chief Inauguration Special II	PNPPCIS2	Path to Nowhere	73200	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNPP	0	4.00	hybrid
2350	Chief Inauguration Special III	PNPPCIS3	Path to Nowhere	146300	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNPP	0	4.00	hybrid
2351	Chief Inauguration Special IV	PNPPCIS4	Path to Nowhere	429700	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNPP	0	4.00	hybrid
2374	Collection Adventure Log	RCKACA	Ragnarok M Classic	355000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RCKA	0	4.00	hybrid
2375	Upgrade Adventure Log	RCKAUA	Ragnarok M Classic	107000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RCKA	0	4.00	hybrid
2376	Abundant Double Zeny Supply	RCMLAD	Ragnarok M Classic	465000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RCML	0	4.00	hybrid
2377	Petty Double Zeny Supply Box	RCMLPD	Ragnarok M Classic	156000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RCML	0	4.00	hybrid
2378	1,8M (Zeny)	RCZN1	Ragnarok M Classic	43000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RCZN	0	4.00	hybrid
2379	12.8M + 768Th (Zeny)	RCZN12	Ragnarok M Classic	253000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RCZN	0	4.00	hybrid
2380	144M + 16M (Zeny) 	RCZN144	Ragnarok M Classic	2745000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RCZN	0	4.00	hybrid
2381	3M + 60 Th (Zeny)	RCZN3	Ragnarok M Classic	71000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RCZN	0	4.00	hybrid
2382	32.8M + 2.7M (Zeny)	RCZN32	Ragnarok M Classic	640000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RCZN	0	4.00	hybrid
2383	360M + 40M (Zeny)	RCZN360	Ragnarok M Classic	6860000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RCZN	0	4.00	hybrid
2384	6.8M + 272Th (Zeny)	RCZN6	Ragnarok M Classic	142000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RCZN	0	4.00	hybrid
2385	64.8M + 7.2M (Zeny) 	RCZN64	Ragnarok M Classic	1227000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	RCZN	0	4.00	hybrid
2386	12+2 Big Cat Coins	REBCC12	Ragnarok M Eternal Love	29200	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	REBCC	0	4.00	hybrid
2387	120+25 Big Cat Coins	REBCC120	Ragnarok M Eternal Love	290200	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	REBCC	0	4.00	hybrid
2388	18+3 Big Cat Coins	REBCC18	Ragnarok M Eternal Love	44200	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	REBCC	0	4.00	hybrid
2389	24+4 Big Cat Coins 	REBCC24	Ragnarok M Eternal Love	58200	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	REBCC	0	4.00	hybrid
2390	298+75 Big Cat Coins	REBCC298	Ragnarok M Eternal Love	704000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	REBCC	0	4.00	hybrid
2391	30+6 Big Cat Coins	REBCC30	Ragnarok M Eternal Love	72900	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	REBCC	0	4.00	hybrid
2392	598+150 Big Cat Coins	REBCC598	Ragnarok M Eternal Love	1340000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	REBCC	0	4.00	hybrid
2393	6+1 Big Cat Coins	REBCC6	Ragnarok M Eternal Love	15200	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	REBCC	0	4.00	hybrid
2394	60+12 Big Cat Coins 	REBCC60	Ragnarok M Eternal Love	145000	\N	\N	t	f	2025-11-01 14:38:07.630638	2025-11-10 09:44:47.421983	REBCC	0	4.00	hybrid
2454	10.000 Ruby	SERU10K	SEAL M SEA	1037000	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:44:56.355911	SERU	0	4.00	hybrid
2492	5.600 Golder Star	SUGS5600	Super SUS	529356	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:45:02.751488	SUGS	0	4.00	hybrid
2493	Monthly Card	SUPPMC	Super SUS	142250	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:45:02.751488	SUPP	0	4.00	hybrid
2494	Super Pass Bundle	SUPPPB	Super SUS	135150	\N	\N	t	f	2025-11-01 14:38:15.049651	2025-11-10 09:45:02.751488	SUPP	0	4.00	hybrid
2495	Super Pass	SUPPSP	Super SUS	73800	\N	\N	t	f	2025-11-01 14:38:20.653429	2025-11-10 09:45:02.751488	SUPP	0	4.00	hybrid
2496	Super VIP Card	SUPPVIP	Super SUS	162800	\N	\N	t	f	2025-11-01 14:38:20.653429	2025-11-10 09:45:02.751488	SUPP	0	4.00	hybrid
2497	Weekly Card	SUPPWC	Super SUS	15800	\N	\N	t	f	2025-11-01 14:38:20.653429	2025-11-10 09:45:02.751488	SUPP	0	4.00	hybrid
2498	1800 Crystals	TACR1800	Tarisland	368080	\N	\N	t	f	2025-11-01 14:38:20.653429	2025-11-10 09:45:02.751488	TACR	0	4.00	hybrid
2499	330 Crystals	TACR330	Tarisland	77360	\N	\N	t	f	2025-11-01 14:38:20.653429	2025-11-10 09:45:02.751488	TACR	0	4.00	hybrid
2500	3600 Crystals	TACR3600	Tarisland	736080	\N	\N	t	f	2025-11-01 14:38:20.653429	2025-11-10 09:45:02.751488	TACR	0	4.00	hybrid
2501	60 Crystals	TACR60	Tarisland	16640	\N	\N	t	f	2025-11-01 14:38:20.653429	2025-11-10 09:45:02.751488	TACR	0	4.00	hybrid
2502	700 Crystals 	TACR700	Tarisland	156480	\N	\N	t	f	2025-11-01 14:38:20.653429	2025-11-10 09:45:02.751488	TACR	0	4.00	hybrid
2503	7250 Crystals	TACR7250	Tarisland	1564080	\N	\N	t	f	2025-11-01 14:38:20.653429	2025-11-10 09:45:02.751488	TACR	0	4.00	hybrid
2504	Semiannual Ticket (180d)	TATI180D	Tarisland	322080	\N	\N	t	f	2025-11-01 14:38:20.653429	2025-11-10 09:45:02.751488	TATI	0	4.00	hybrid
2505	Monthly Ticket (30d)	TATI30D	Tarisland	58040	\N	\N	t	f	2025-11-01 14:38:20.653429	2025-11-10 09:45:02.751488	TATI	0	4.00	hybrid
2506	Weekly Ticket (7d)	TATI7D	Tarisland	20320	\N	\N	t	f	2025-11-01 14:38:20.653429	2025-11-10 09:45:02.751488	TATI	0	4.00	hybrid
2507	1200 Diamond	TJDD1200	Tom and Jerry Chase	275508	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TJDD	0	4.00	hybrid
2508	180 Diamond	TJDD180	Tom and Jerry Chase	41635	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TJDD	0	4.00	hybrid
2509	1800 Diamond	TJDD1800	Tom and Jerry Chase	410097	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TJDD	0	4.00	hybrid
2510	300 Diamond	TJDD300	Tom and Jerry Chase	65866	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TJDD	0	4.00	hybrid
2511	3000 Diamond	TJDD3000	Tom and Jerry Chase	688226	\N	\N	t	f	2025-11-01 14:38:29.191925	2025-11-10 09:45:11.596602	TJDD	0	4.00	hybrid
2565	1.090 Lunites (980 + 110 Bonus)	WWLU1090	Wuthering Waves	224250	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:17.852736	WWLU	0	4.00	hybrid
2566	2.240 Lunites (1980 + 260 Bonus)	WWLU2240	Wuthering Waves	429900	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:17.852736	WWLU	0	4.00	hybrid
2567	330 Lunites (300 + 30 Bonus)	WWLU330	Wuthering Waves	71200	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:17.852736	WWLU	0	4.00	hybrid
2568	3.880 Lunites (3280 + 600 Bonus)	WWLU3880	Wuthering Waves	718200	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:17.852736	WWLU	0	4.00	hybrid
2569	60 Lunites	WWLU60	Wuthering Waves	14900	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:17.852736	WWLU	0	4.00	hybrid
2570	8.080 Lunites (6480 + 1600 Bonus)	WWLU8080	Wuthering Waves	1435350	\N	\N	t	f	2025-11-01 14:38:34.52604	2025-11-10 09:45:17.852736	WWLU	0	4.00	hybrid
2571	10.200 Coins 	ZPCC10K2	Zepeto	27836	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPCC	0	4.00	hybrid
2572	110.000 Coins	ZPCC110K	Zepeto	290840	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPCC	0	4.00	hybrid
2573	21.000 Coins 	ZPCC21K	Zepeto	54806	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPCC	0	4.00	hybrid
2574	234.000 Coins	ZPCC234K	Zepeto	553752	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPCC	0	4.00	hybrid
2575	25.200 Coins	ZPCC25K2	Zepeto	69901	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPCC	0	4.00	hybrid
2576	300.000 Coins 	ZPCC300K	Zepeto	771723	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPCC	0	4.00	hybrid
2577	38.900 Coins 	ZPCC38K9	Zepeto	95261	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPCC	0	4.00	hybrid
2578	40.700 Coins	ZPCC40K7	Zepeto	111327	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPCC	0	4.00	hybrid
2579	4.680 Coins 	ZPCC4680	Zepeto	15093	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPCC	0	4.00	hybrid
2580	62.800 Coins 	ZPCC62K8	Zepeto	149201	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPCC	0	4.00	hybrid
2581	9.700 Coins 	ZPCC9700	Zepeto	28475	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPCC	0	4.00	hybrid
2582	1.000 Zems	ZPZM1000	Zepeto	893439	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPZM	0	4.00	hybrid
2583	125 Zems 	ZPZM125	Zepeto	108745	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPZM	0	4.00	hybrid
2584	128 Zems	ZPZM128	Zepeto	118303	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPZM	0	4.00	hybrid
2585	14 Zems	ZPZM14	Zepeto	15093	\N	\N	t	f	2025-11-01 14:38:39.747561	2025-11-10 09:45:23.057577	ZPZM	0	4.00	hybrid
2621	Voucher $20	BNGC20	Battlenet	331145	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BNGC	0	4.00	hybrid
2622	Voucher $5	BNGC5	Battlenet	82144	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BNGC	0	4.00	hybrid
2623	Voucher $50	BNGC50	Battlenet	797849	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BNGC	0	4.00	hybrid
2624	Voucher IDR 150.000	BZIDR150	Blizzard 	168109	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BZIDR	0	4.00	hybrid
2625	Voucher IDR 300.000	BZIDR300	Blizzard 	335218	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BZIDR	0	4.00	hybrid
2626	Voucher IDR 75.000	BZIDR75	Blizzard 	85555	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BZIDR	0	4.00	hybrid
2627	Voucher USD 10	BZUSD10	Blizzard 	168109	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BZUSD	0	4.00	hybrid
2628	Voucher USD 20	BZUSD20	Blizzard 	319300	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BZUSD	0	4.00	hybrid
2629	Voucher USD 5	BZUSD5	Blizzard 	85555	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BZUSD	0	4.00	hybrid
2630	Voucher 10.000 Cherry Credits	CCCC10	Cherry Credits	129009	\N	\N	t	f	2025-11-01 21:50:49.839344	2025-11-10 09:43:41.499789	CCCC	0	4.00	hybrid
2631	Voucher 100.000 Cherry Credits	CCCC100	Cherry Credits	1262976	\N	\N	t	f	2025-11-01 21:50:49.839344	2025-11-10 09:43:41.499789	CCCC	0	4.00	hybrid
2632	Voucher 30.000 Cherry Credits	CCCC30	Cherry Credits	380989	\N	\N	t	f	2025-11-01 21:50:49.839344	2025-11-10 09:43:41.499789	CCCC	0	4.00	hybrid
2633	Voucher 5.000 Cherry Credits	CCCC5	Cherry Credits	66024	\N	\N	t	f	2025-11-01 21:50:49.839344	2025-11-10 09:43:41.499789	CCCC	0	4.00	hybrid
2634	Voucher 50.000 Cherry Credits	CCCC50	Cherry Credits	632968	\N	\N	t	f	2025-11-01 21:50:49.839344	2025-11-10 09:43:41.499789	CCCC	0	4.00	hybrid
2635	Voucher 100 Ecoins	CFEC100	Crossfire	30188	\N	\N	t	f	2025-11-01 21:50:49.839344	2025-11-10 09:43:41.499789	CFEC	0	4.00	hybrid
2636	Voucher 1000 Ecoins	CFEC1000	Crossfire	274878	\N	\N	t	f	2025-11-01 21:50:49.839344	2025-11-10 09:43:41.499789	CFEC	0	4.00	hybrid
2637	Voucher 20 Ecoins	CFEC20	Crossfire	8438	\N	\N	t	f	2025-11-01 21:50:49.839344	2025-11-10 09:43:41.499789	CFEC	0	4.00	hybrid
2638	Voucher 200 Ecoins	CFEC200	Crossfire	57376	\N	\N	t	f	2025-11-01 21:50:49.839344	2025-11-10 09:43:41.499789	CFEC	0	4.00	hybrid
2643	Voucher GeForceNow (12 hour Pass)	GNPP12	GeForce NOW	142091	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GNPP	0	4.00	hybrid
2644	Voucher GeForceNow (3 hour Pass)	GNPP3	GeForce NOW	56362	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GNPP	0	4.00	hybrid
2645	Voucher GeForceNOW (1 month Lite)	GNPP30L	GeForce NOW	35367	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GNPP	0	4.00	hybrid
2646	Voucher GeForceNOW (1 month Premium)	GNPP30P	GeForce NOW	45864	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GNPP	0	4.00	hybrid
2647	Voucher GeForceNOW (1 month Premium Pro)	GNPP30PP	GeForce NOW	99266	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GNPP	0	4.00	hybrid
2648	Voucher GeForceNow (6 hour Pass)	GNPP6	GeForce NOW	184080	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GNPP	0	4.00	hybrid
2658	Voucher Garena 165 Shell (ID)	GSVID165	Garena Shell	46000	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GSVID	0	4.00	hybrid
2659	Voucher Garena 33 Shell (ID)	GSVID33	Garena Shell	9400	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GSVID	0	4.00	hybrid
2660	Voucher Garena 330 Shell (ID)	GSVID330	Garena Shell	91500	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GSVID	0	4.00	hybrid
2661	Voucher Garena 66 Shell (ID)	GSVID66	Garena Shell	18500	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GSVID	0	4.00	hybrid
2662	Voucher Garena 1.000 Shell (PHP / PHILIPPINES)	GSVPH1K	Garena Shell	268000	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GSVPH	0	4.00	hybrid
2663	Voucher Basic 1 Day	IQBA1	IQIYI	3000	\N	\N	t	f	2025-11-01 21:51:10.668587	2025-11-10 09:44:05.573155	IQBA	0	4.00	hybrid
2664	Voucher Basic 2 Weeks	IQBA14	IQIYI	11000	\N	\N	t	f	2025-11-01 21:51:10.668587	2025-11-10 09:44:05.573155	IQBA	0	4.00	hybrid
2665	Voucher Basic 6 Months	IQBA180	IQIYI	85000	\N	\N	t	f	2025-11-01 21:51:10.668587	2025-11-10 09:44:05.573155	IQBA	0	4.00	hybrid
2666	Voucher Basic 3 Days	IQBA3	IQIYI	5000	\N	\N	t	f	2025-11-01 21:51:10.668587	2025-11-10 09:44:05.573155	IQBA	0	4.00	hybrid
2667	Voucher Basic 1 Month	IQBA30	IQIYI	16000	\N	\N	t	f	2025-11-01 21:51:10.668587	2025-11-10 09:44:05.573155	IQBA	0	4.00	hybrid
2668	Voucher Basic 1 Year	IQBA365	IQIYI	153000	\N	\N	t	f	2025-11-01 21:51:10.668587	2025-11-10 09:44:05.573155	IQBA	0	4.00	hybrid
2669	Voucher Basic 1 Week	IQBA7	IQIYI	9000	\N	\N	t	f	2025-11-01 21:51:10.668587	2025-11-10 09:44:05.573155	IQBA	0	4.00	hybrid
2670	Voucher Basic 3 Months	IQBA90	IQIYI	44000	\N	\N	t	f	2025-11-01 21:51:10.668587	2025-11-10 09:44:05.573155	IQBA	0	4.00	hybrid
2671	Voucher Standard 1 Day	IQST1	IQIYI	3000	\N	\N	t	f	2025-11-01 21:51:10.668587	2025-11-10 09:44:05.573155	IQST	0	4.00	hybrid
2672	Voucher Standard 2 Weeks	IQST14	IQIYI	11000	\N	\N	t	f	2025-11-01 21:51:17.927916	2025-11-10 09:44:05.573155	IQST	0	4.00	hybrid
2673	Voucher Standard 6 Months	IQST180	IQIYI	85000	\N	\N	t	f	2025-11-01 21:51:17.927916	2025-11-10 09:44:05.573155	IQST	0	4.00	hybrid
2674	Voucher Standard 3 Days	IQST3	IQIYI	5000	\N	\N	t	f	2025-11-01 21:51:17.927916	2025-11-10 09:44:05.573155	IQST	0	4.00	hybrid
2718	Voucher Razer Gold IDR 10.000	RGIDR10	Razer Gold	9700	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGIDR	0	4.00	hybrid
2719	Voucher Razer Gold IDR 100.000	RGIDR100	Razer Gold	95600	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGIDR	0	4.00	hybrid
2720	Voucher Razer Gold IDR 1.000.000	RGIDR1JT	Razer Gold	955000	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGIDR	0	4.00	hybrid
2721	Voucher Razer Gold IDR 20.000	RGIDR20	Razer Gold	19500	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGIDR	0	4.00	hybrid
2722	Voucher Razer Gold IDR 200.000	RGIDR200	Razer Gold	190500	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGIDR	0	4.00	hybrid
2723	Voucher Razer Gold IDR 50.000	RGIDR50	Razer Gold	48500	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGIDR	0	4.00	hybrid
2724	Voucher Razer Gold IDR 500.000	RGIDR500	Razer Gold	475000	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGIDR	0	4.00	hybrid
2725	Voucher Razer Gold PH 100	RGPHP100	Razer Gold	30652	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGPHP	0	4.00	hybrid
2726	Voucher Razer Gold PH 1000	RGPHP1000	Razer Gold	280178	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGPHP	0	4.00	hybrid
2727	Voucher Razer Gold PH 150	RGPHP150	Razer Gold	43773	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGPHP	0	4.00	hybrid
2728	Voucher Razer Gold PH 20	RGPHP20	Razer Gold	8589	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGPHP	0	4.00	hybrid
2679	Voucher Nintendo 10$ 	NNUSD10	Nintendo Eshop	151440	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:33.292695	NNUSD	0	4.00	hybrid
2680	Voucher Nintendo 20$ 	NNUSD20	Nintendo Eshop	301870	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:33.292695	NNUSD	0	4.00	hybrid
2681	Voucher Nintendo 35$ 	NNUSD35	Nintendo Eshop	545180	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:33.292695	NNUSD	0	4.00	hybrid
2691	Voucher 1800 UC	PGVV1800	PUBG Voucher	361000	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:39.980819	PGVV	0	4.00	hybrid
2692	Voucher 325 UC	PGVV325	PUBG Voucher	73000	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:39.980819	PGVV	0	4.00	hybrid
2693	Voucher 3850 UC	PGVV3850	PUBG Voucher	722000	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:39.980819	PGVV	0	4.00	hybrid
2694	Voucher 60 UC	PGVV60	PUBG Voucher	15000	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:39.980819	PGVV	0	4.00	hybrid
2695	Voucher 660 UC	PGVV660	PUBG Voucher	145000	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:39.980819	PGVV	0	4.00	hybrid
2696	Voucher 8100 UC	PGVV8100	PUBG Voucher	1445000	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:39.980819	PGVV	0	4.00	hybrid
2697	Voucher PSN IDR 100.000	PSIDR100	Play Station PSN	95700	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:39.980819	PSIDR	0	4.00	hybrid
2698	Voucher PSN IDR 1.000.000	PSIDR1JT	Play Station PSN	948000	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:39.980819	PSIDR	0	4.00	hybrid
2699	Voucher PSN IDR 1.500.000	PSIDR1JT5	Play Station PSN	1421500	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:39.980819	PSIDR	0	4.00	hybrid
2700	Voucher PSN IDR 200.000	PSIDR200	Play Station PSN	195170	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:39.980819	PSIDR	0	4.00	hybrid
2701	Voucher PSN IDR 300.000	PSIDR300	Play Station PSN	285100	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:39.980819	PSIDR	0	4.00	hybrid
2702	Voucher PSN IDR 600.000	PSIDR600	Play Station PSN	569200	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:39.980819	PSIDR	0	4.00	hybrid
2715	100 Robux	RBRB100	Roblox	82700	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:39.980819	RBRBX	0	4.00	hybrid
2729	Voucher Razer Gold PH 2000	RGPHP2000	Razer Gold	556032	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGPHP	0	4.00	hybrid
2730	Voucher Razer Gold PH 250	RGPHP250	Razer Gold	72084	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGPHP	0	4.00	hybrid
2731	Voucher Razer Gold PH 300	RGPHP300	Razer Gold	85955	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGPHP	0	4.00	hybrid
2732	Voucher Razer Gold PH 50	RGPHP50	Razer Gold	16572	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGPHP	0	4.00	hybrid
2733	Voucher Razer Gold PH 500	RGPHP500	Razer Gold	141258	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGPHP	0	4.00	hybrid
2734	Voucher Razer Gold PH 5000	RGPHP5000	Razer Gold	1389660	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:47.421983	RGPHP	0	4.00	hybrid
2735	Voucher 12000	SVIDR12	Steam	0	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	SVIDR	0	4.00	hybrid
2736	Voucher 120000	SVIDR120	Steam	0	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	SVIDR	0	4.00	hybrid
2737	Voucher 250000	SVIDR250	Steam	0	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	SVIDR	0	4.00	hybrid
2738	Voucher 400000	SVIDR400	Steam	0	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	SVIDR	0	4.00	hybrid
2739	Voucher 45000	SVIDR45	Steam	0	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	SVIDR	0	4.00	hybrid
2740	Voucher 6000	SVIDR6	Steam	0	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	SVIDR	0	4.00	hybrid
2741	Voucher 60000	SVIDR60	Steam	0	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	SVIDR	0	4.00	hybrid
2742	Voucher 600000	SVIDR600	Steam	0	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	SVIDR	0	4.00	hybrid
2743	Voucher 8000	SVIDR8	Steam	0	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	SVIDR	0	4.00	hybrid
2744	Voucher 90000	SVIDR90	Steam	0	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	SVIDR	0	4.00	hybrid
2745	Voucher IDR 500.000 (2.040 Coins)	TCIDR2040	TikTok Coin	495000	\N	\N	t	f	2025-11-01 21:52:02.131898	2025-11-10 09:45:02.751488	TCIDR	0	4.00	hybrid
2751	Voucher 1 Bulan Membership	XBMU1	XBOX	157000	\N	\N	t	f	2025-11-01 21:52:17.522579	2025-11-10 09:45:17.852736	XBMUSD	0	4.00	hybrid
2752	Voucher 3 Bulan Membership	XBMU3	XBOX	372500	\N	\N	t	f	2025-11-01 21:52:17.522579	2025-11-10 09:45:17.852736	XBMUSD	0	4.00	hybrid
1439	4.400 Empire Coins	AEEC4400	Age of Empires Mobile	147781	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AEEC	0	4.00	hybrid
1440	50.000 Empire Coins	AEEC50	Age of Empires Mobile	1472458	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AEEC	0	4.00	hybrid
1441	9.200 Empire Coins	AEEC9200	Age of Empires Mobile	298407	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AEEC	0	4.00	hybrid
1442	126 Dragon Crystals (120 + 6 Bonus)	AFDC126	AFK JOURNEY	75390	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AFDC	0	4.00	hybrid
1443	1554 Dragon Crystals (1480 + 74 Bonus)	AFDC1554	AFK JOURNEY	747840	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AFDC	0	4.00	hybrid
1444	21 Dragon Crystals (20 + 1 Bonus)	AFDC21	AFK JOURNEY	15380	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AFDC	0	4.00	hybrid
1445	294 Dragon Crystals (280 + 14 Bonus)	AFDC294	AFK JOURNEY	150400	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AFDC	0	4.00	hybrid
1446	3150 Dragon Crystals (3000 + 150 Bonus)	AFDC3150	AFK JOURNEY	1494260	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AFDC	0	4.00	hybrid
2649	Voucher IDR 10.000	GPIDR10	Google Play	8900	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GPIDR	0	4.00	hybrid
2650	Voucher IDR 100.000	GPIDR100	Google Play	88405	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GPIDR	0	4.00	hybrid
2651	Voucher IDR 150.000	GPIDR150	Google Play	132580	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GPIDR	0	4.00	hybrid
2652	Voucher IDR 20.000	GPIDR20	Google Play	17720	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GPIDR	0	4.00	hybrid
2653	Voucher IDR 300.000	GPIDR300	Google Play	265110	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GPIDR	0	4.00	hybrid
2654	Voucher IDR 35.000	GPIDR35	Google Play	30975	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GPIDR	0	4.00	hybrid
2655	Voucher IDR 5.000	GPIDR5	Google Play	4500	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GPIDR	0	4.00	hybrid
2656	Voucher IDR 50.000	GPIDR50	Google Play	50420	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GPIDR	0	4.00	hybrid
2657	Voucher IDR 500.000	GPIDR500	Google Play	441810	\N	\N	t	f	2025-11-01 21:51:02.725722	2025-11-10 09:43:56.444774	GPIDR	0	4.00	hybrid
2755	234 + 23 Diamond 	MLID257	MOBILE LEGENDS	67900	\N	\N	t	f	2025-11-09 18:26:16.655181	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2753	Voucher XBOX $10	XBUSD10	XBOX	165000	\N	\N	t	f	2025-11-01 21:52:17.522579	2025-11-10 09:45:17.852736	XBUSD	0	4.00	hybrid
2754	Voucher XBOX $15	XBUSD15	XBOX	248000	\N	\N	t	f	2025-11-01 21:52:17.522579	2025-11-10 09:45:17.852736	XBUSD	0	4.00	hybrid
1447	588 Dragon Crystals (560 + 28 Bonus)	AFDC588	AFK JOURNEY	308215	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AFDC	0	4.00	hybrid
1448	Esperia Monthly - Classic Gazette	AFEMCG	AFK JOURNEY	75740	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AFEM	0	4.00	hybrid
1449	Esperia Monthly - Premium Gazette	AFEMPG	AFK JOURNEY	234940	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AFEM	0	4.00	hybrid
1450	Growth Bundle	AFGBGB	AFK JOURNEY	450975	\N	\N	t	f	2025-10-28 15:26:57.341042	2025-11-10 09:43:33.618294	AFGB	0	4.00	hybrid
2607	Voucher 100 Diamond 	BLVV100	Bigo Live	32066	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BLVV	0	4.00	hybrid
2608	Voucher 1000 Diamond 	BLVV1000	Bigo Live	311657	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BLVV	0	4.00	hybrid
2609	Voucher 150 Diamond 	BLVV150	Bigo Live	47909	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BLVV	0	4.00	hybrid
2610	Voucher 200 Diamond 	BLVV200	Bigo Live	63131	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BLVV	0	4.00	hybrid
2611	Voucher 2000 Diamond 	BLVV2000	Bigo Live	622314	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BLVV	0	4.00	hybrid
2612	Voucher 25 Diamond 	BLVV25	Bigo Live	8767	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BLVV	0	4.00	hybrid
2613	Voucher 250 Diamond 	BLVV250	Bigo Live	78664	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BLVV	0	4.00	hybrid
2614	Voucher 300 Diamond 	BLVV300	Bigo Live	93266	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BLVV	0	4.00	hybrid
2615	Voucher 3000 Diamond 	BLVV3000	Bigo Live	932970	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BLVV	0	4.00	hybrid
2616	Voucher  4000 Diamond 	BLVV4000	Bigo Live	1243627	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BLVV	0	4.00	hybrid
2617	Voucher 50 Diamond 	BLVV50	Bigo Live	16533	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BLVV	0	4.00	hybrid
2618	Voucher 500 Diamond 	BLVV500	Bigo Live	156328	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BLVV	0	4.00	hybrid
2619	Voucher 750 Diamond 	BLVV750	Bigo Live	218460	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BLVV	0	4.00	hybrid
2620	Voucher $10	BNGC10	Battlenet	162784	\N	\N	t	f	2025-11-01 21:50:43.27609	2025-11-10 09:43:33.618294	BNGC	0	4.00	hybrid
1464	100 Gold	BSGL100	Blood Strike	12500	\N	\N	t	f	2025-10-28 15:27:02.039238	2025-11-10 09:43:33.618294	BSGL	0	4.00	hybrid
1465	1.000 Gold	BSGL1000	Blood Strike	119900	\N	\N	t	f	2025-10-28 15:27:02.039238	2025-11-10 09:43:33.618294	BSGL	0	4.00	hybrid
1466	2.000 Gold	BSGL2000	Blood Strike	599200	\N	\N	t	f	2025-10-28 15:27:02.039238	2025-11-10 09:43:33.618294	BSGL	0	4.00	hybrid
1467	300 Gold	BSGL300	Blood Strike	36000	\N	\N	t	f	2025-10-28 15:27:02.039238	2025-11-10 09:43:33.618294	BSGL	0	4.00	hybrid
1468	500 Gold	BSGL500	Blood Strike	61000	\N	\N	t	f	2025-10-28 15:27:02.039238	2025-11-10 09:43:33.618294	BSGL	0	4.00	hybrid
1469	5.000 Gold	BSGL5000	Blood Strike	239600	\N	\N	t	f	2025-10-28 15:27:02.039238	2025-11-10 09:43:33.618294	BSGL	0	4.00	hybrid
1470	Strike Pass Elite	BSPS1	Blood Strike	47300	\N	\N	t	f	2025-10-28 15:27:02.039238	2025-11-10 09:43:33.618294	BSPS	0	4.00	hybrid
1471	Strike Pass Premium	BSPS2	Blood Strike	106900	\N	\N	t	f	2025-10-28 15:27:02.039238	2025-11-10 09:43:33.618294	BSPS	0	4.00	hybrid
1472	Ultra Skin Lucky Chest	BSPSLC	Blood Strike	6750	\N	\N	t	f	2025-10-28 15:27:02.039238	2025-11-10 09:43:33.618294	BSPS	0	4.00	hybrid
1473	Level Up Pass	BSPSLU	Blood Strike	26850	\N	\N	t	f	2025-10-28 15:27:02.039238	2025-11-10 09:43:33.618294	BSPS	0	4.00	hybrid
1474	1.980 Opals + 499 Bonus	CAOP1980	Crystal of Atlan	420250	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:33.618294	CAOP	0	4.00	hybrid
1475	300 Opals + 60 Bonus	CAOP300	Crystal of Atlan	69750	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:33.618294	CAOP	0	4.00	hybrid
1476	3.280 Opals + 965 Bonus	CAOP3280	Crystal of Atlan	700000	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:33.618294	CAOP	0	4.00	hybrid
1477	60 Opals + 9 Bonus	CAOP60	Crystal of Atlan	14350	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:33.618294	CAOP	0	4.00	hybrid
1478	6.480 Opals + 2.126 Bonus	CAOP6480	Crystal of Atlan	1399100	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:33.618294	CAOP	0	4.00	hybrid
1479	980 Opals + 229 Bonus	CAOP980	Crystal of Atlan	219400	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:33.618294	CAOP	0	4.00	hybrid
1484	3.280 Vouchers + 165 Bonus	CAVO3280	Crystal of Atlan	700000	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CAVO	0	4.00	hybrid
1485	60 Vouchers + 3 Bonus	CAVO60	Crystal of Atlan	14350	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CAVO	0	4.00	hybrid
1486	6.480 Vouchers + 326 Bonus	CAVO6480	Crystal of Atlan	1399100	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CAVO	0	4.00	hybrid
1487	980 Vouchers + 49 Bonus	CAVO980	Crystal of Atlan	219400	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CAVO	0	4.00	hybrid
1493	Extra Premium (Pass)	CDPPEP	Dunk City Dynasty	127300	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CDPP	0	4.00	hybrid
1494	Party Membership (Package)	CDPPPM	Dunk City Dynasty	76700	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CDPP	0	4.00	hybrid
1495	Premium Pass (Package)	CDPPPP	Dunk City Dynasty	76700	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CDPP	0	4.00	hybrid
1496	Rookie Gift (Package)	CDPPRG	Dunk City Dynasty	45800	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CDPP	0	4.00	hybrid
1497	Party Permanent (VIP)	CDPPVIP	Dunk City Dynasty	205000	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CDPP	0	4.00	hybrid
1498	2.280 Tokens (.1980 + 300 Free Tokens)	CDTO1980	Dunk City Dynasty	474000	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CDTO	0	4.00	hybrid
1499	330 Tokens (300 + 30 Free Tokens)	CDTO300	Dunk City Dynasty	76900	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CDTO	0	4.00	hybrid
1500	3.880 Tokens (3280 + 600 Free Tokens)	CDTO3280	Dunk City Dynasty	791000	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CDTO	0	4.00	hybrid
1501	60 (Tokens)	CDTO60	Dunk City Dynasty	12500	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CDTO	0	4.00	hybrid
1502	8.110 Tokens (6.480 + 1630 Free Tokens)	CDTO6480	Dunk City Dynasty	121000	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CDTO	0	4.00	hybrid
1503	1.110 Tokens (980 + 130 Free Tokens)	CDTO980	Dunk City Dynasty	200300	\N	\N	t	f	2025-10-28 15:27:06.257744	2025-11-10 09:43:41.499789	CDTO	0	4.00	hybrid
2639	Voucher 300 Ecoins	CFEC300	Crossfire	84563	\N	\N	t	f	2025-11-01 21:50:49.839344	2025-11-10 09:43:41.499789	CFEC	0	4.00	hybrid
2640	Voucher 400 Ecoins	CFEC400	Crossfire	111751	\N	\N	t	f	2025-11-01 21:50:49.839344	2025-11-10 09:43:41.499789	CFEC	0	4.00	hybrid
2641	Voucher 50 Ecoins	CFEC50	Crossfire	16594	\N	\N	t	f	2025-11-01 21:50:49.839344	2025-11-10 09:43:41.499789	CFEC	0	4.00	hybrid
2642	Voucher 500 Ecoins	CFEC500	Crossfire	138939	\N	\N	t	f	2025-11-01 21:50:49.839344	2025-11-10 09:43:41.499789	CFEC	0	4.00	hybrid
1504	10.000 + 1.000 Wallet Points	CIWP10K	Cabal Infinite Combo	2016500	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:41.499789	CIWP	0	4.00	hybrid
1505	1.000 + 100 Wallet Points	CIWP1K	Cabal Infinite Combo	201800	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:41.499789	CIWP	0	4.00	hybrid
1506	200 + 20 Wallet Points	CIWP200	Cabal Infinite Combo	40500	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:41.499789	CIWP	0	4.00	hybrid
1507	5.000 + 500 Wallet Points	CIWP5K	Cabal Infinite Combo	1008500	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:41.499789	CIWP	0	4.00	hybrid
1508	980 + 50 Golden Ball Pack	CTGB1030	Captain Tsubasa Ace	224300	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:41.499789	CTGB	0	4.00	hybrid
1509	1.280 + 65 Golden Ball Pack	CTGB1345	Captain Tsubasa Ace	295000	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:41.499789	CTGB	0	4.00	hybrid
1510	1.980 +198 Golden Ball Pack	CTGB2178	Captain Tsubasa Ace	430000	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:41.499789	CTGB	0	4.00	hybrid
1511	300 + 15 Golden Ball Pack	CTGB315	Captain Tsubasa Ace	71400	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:41.499789	CTGB	0	4.00	hybrid
1512	3.280 + 328 Golden Ball Pack	CTGB3608	Captain Tsubasa Ace	675200	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:41.499789	CTGB	0	4.00	hybrid
1513	6 Golden Ball Pack	CTGB6	Captain Tsubasa Ace	1900	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:41.499789	CTGB	0	4.00	hybrid
1514	60 + 3 Golden Ball Pack	CTGB63	Captain Tsubasa Ace	14700	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:41.499789	CTGB	0	4.00	hybrid
1515	6.480 + 648 Golden Ball Pack	CTGB7128	Captain Tsubasa Ace	1351000	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:41.499789	CTGB	0	4.00	hybrid
1516	680 + 35 Golden Ball Pack	CTGB715	Captain Tsubasa Ace	143400	\N	\N	t	f	2025-10-28 15:27:18.715556	2025-11-10 09:43:41.499789	CTGB	0	4.00	hybrid
1534	999 + 149 Voucher	DHVO999	Dynasty Heroes Samkok Legend	143700	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	DHVO	0	4.00	hybrid
1535	9.999 + 1499 Voucher	DHVO9999	Dynasty Heroes Samkok Legend	1436800	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	DHVO	0	4.00	hybrid
1536	10 Eggy Coins	EPCO10	EGGY PARTY	1900	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	EPCO	0	4.00	hybrid
1537	120 Eggy Coins + 6 Bonus	EPCO120	EGGY PARTY	22200	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	EPCO	0	4.00	hybrid
1538	1.380 Eggy Coins + 144 Bonus	EPCO1380	EGGY PARTY	245700	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	EPCO	0	4.00	hybrid
1539	2.080 Eggy Coins + 216 Bonus	EPCO2080	EGGY PARTY	370250	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	EPCO	0	4.00	hybrid
1540	300 Eggy Coins + 24 Bonus	EPCO300	EGGY PARTY	55700	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	EPCO	0	4.00	hybrid
1541	3.450 Eggy Coins + 423 Bonus	EPCO3450	EGGY PARTY	617200	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	EPCO	0	4.00	hybrid
1542	60 Eggy Coins + 3 Bonus	EPCO60	EGGY PARTY	11600	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	EPCO	0	4.00	hybrid
1543	6.880 Eggy Coins + 903 Bonus	EPCO6880	EGGY PARTY	1220500	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	EPCO	0	4.00	hybrid
1544	700 Eggy Coins + 57 Bonus	EPCO700	EGGY PARTY	123500	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	EPCO	0	4.00	hybrid
1545	100 Diamond	FFGLOB100	FREE FIRE	16242	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFGLOB	0	4.00	hybrid
1546	1.080 Diamond	FFGLOB1080	FREE FIRE	164346	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFGLOB	0	4.00	hybrid
1547	210 Diamond	FFGLOB210	FREE FIRE	32997	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFGLOB	0	4.00	hybrid
1548	2.200 Diamond	FFGLOB2200	FREE FIRE	328580	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFGLOB	0	4.00	hybrid
1549	4.450 Diamond	FFGLOB4450	FREE FIRE	816340	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFGLOB	0	4.00	hybrid
1550	530 Diamond	FFGLOB530	FREE FIRE	82247	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFGLOB	0	4.00	hybrid
1551	645 Diamond	FFGLOB645	FREE FIRE	122551	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFGLOB	0	4.00	hybrid
1552	6.900 Diamond	FFGLOB6900	FREE FIRE	1224474	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFGLOB	0	4.00	hybrid
1553	10 Diamond	FFID10	FREE FIRE	1692	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1554	100 Diamond	FFID100	FREE FIRE	12450	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1555	1.000 Diamond	FFID1000	FREE FIRE	114250	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1556	1.050 Diamond	FFID1050	FREE FIRE	120400	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1557	1.060 Diamond	FFID1060	FREE FIRE	121942	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1558	1.075 Diamond	FFID1075	FREE FIRE	122400	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1559	1.080 Diamond	FFID1080	FREE FIRE	123171	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1560	1.125 Diamond	FFID1125	FREE FIRE	128550	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1561	1.145 Diamond	FFID1145	FREE FIRE	130550	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1562	12 Diamond	FFID12	FREE FIRE	1810	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1563	120 Diamond	FFID120	FREE FIRE	14450	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1564	1.200 Diamond	FFID1200	FREE FIRE	137471	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1565	1.215 Diamond	FFID1215	FREE FIRE	138700	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1566	125 Diamond	FFID125	FREE FIRE	15221	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1567	130 Diamond	FFID130	FREE FIRE	15992	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1568	1.300 Diamond	FFID1300	FREE FIRE	149163	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1569	140 Diamond	FFID140	FREE FIRE	16450	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1570	1.440 Diamond	FFID1440	FREE FIRE	163150	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1571	145 Diamond	FFID145	FREE FIRE	17221	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1572	1.450 Diamond	FFID1450	FREE FIRE	164692	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1573	14.580 Diamond	FFID14580	FREE FIRE	1643102	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1574	1.490 Diamond	FFID1490	FREE FIRE	169300	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1575	15 Diamond	FFID15	FREE FIRE	2463	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1576	150 Diamond	FFID150	FREE FIRE	17992	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1577	1.510 Diamond	FFID1510	FREE FIRE	171300	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1578	1.580 Diamond	FFID1580	FREE FIRE	179450	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1579	160 Diamond	FFID160	FREE FIRE	19534	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1580	170 Diamond	FFID170	FREE FIRE	20600	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1581	1.795 Diamond	FFID1795	FREE FIRE	203900	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1582	180 Diamond	FFID180	FREE FIRE	22142	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1583	1.800 Diamond	FFID1800	FREE FIRE	204671	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1584	1.875 Diamond	FFID1875	FREE FIRE	213592	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1585	190 Diamond	FFID190	FREE FIRE	22600	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1586	1.975 Diamond	FFID1975	FREE FIRE	225892	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1587	20 Diamond	FFID20	FREE FIRE	3234	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1588	200 Diamond	FFID200	FREE FIRE	24142	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1589	2.000 Diamond	FFID2000	FREE FIRE	228350	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1590	2.005 Diamond	FFID2005	FREE FIRE	228350	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1591	210 Diamond	FFID210	FREE FIRE	24600	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1592	2.100 Diamond	FFID2100	FREE FIRE	240650	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1593	2.140 Diamond	FFID2140	FREE FIRE	244650	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1594	2.160 Diamond	FFID2160	FREE FIRE	244650	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1595	2.180 Diamond	FFID2180	FREE FIRE	247734	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1596	2.190 Diamond	FFID2190	FREE FIRE	249276	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1597	2.200 Diamond	FFID2200	FREE FIRE	250401	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1598	2.210 Diamond	FFID2210	FREE FIRE	250800	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1599	2.225 Diamond	FFID2225	FREE FIRE	253113	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1600	2.280 Diamond	FFID2280	FREE FIRE	258950	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1601	230 Diamond	FFID230	FREE FIRE	27684	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1602	2.350 Diamond	FFID2350	FREE FIRE	267100	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1603	2.355 Diamond	FFID2355	FREE FIRE	267871	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1604	2.400 Diamond	FFID2400	FREE FIRE	273250	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1605	25 Diamond	FFID25	FREE FIRE	4005	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1606	250 Diamond	FFID250	FREE FIRE	30292	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1607	2.575 Diamond	FFID2575	FREE FIRE	293092	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1608	260 Diamond	FFID260	FREE FIRE	30750	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1609	2.720 Diamond	FFID2720	FREE FIRE	309850	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1610	2.750 Diamond	FFID2750	FREE FIRE	314000	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1611	280 Diamond	FFID280	FREE FIRE	32750	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1612	30 Diamond	FFID30	FREE FIRE	4776	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1613	300 Diamond	FFID300	FREE FIRE	35834	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1614	3.000 Diamond	FFID3000	FREE FIRE	340450	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1615	3.310 Diamond	FFID3310	FREE FIRE	375821	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1616	350 Diamond	FFID350	FREE FIRE	40900	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1617	355 Diamond	FFID355	FREE FIRE	40900	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1618	360 Diamond	FFID360	FREE FIRE	41671	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1619	3.620 Diamond	FFID3620	FREE FIRE	410734	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1620	3.640 Diamond	FFID3640	FREE FIRE	415150	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1621	3.675 Diamond	FFID3675	FREE FIRE	416571	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1622	375 Diamond	FFID375	FREE FIRE	43984	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1623	3.800 Diamond	FFID3800	FREE FIRE	434534	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1624	40 Diamond	FFID40	FREE FIRE	6340	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1625	400 Diamond	FFID400	FREE FIRE	47050	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1626	4.000 Diamond	FFID4000	FREE FIRE	456671	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1627	405 Diamond	FFID405	FREE FIRE	47050	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1628	4.050 Diamond	FFID4050	FREE FIRE	462821	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1629	420 Diamond	FFID420	FREE FIRE	49050	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1630	425 Diamond	FFID425	FREE FIRE	49050	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1631	4.340 Diamond	FFID4340	FREE FIRE	492234	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1632	4.450 Diamond	FFID4450	FREE FIRE	507884	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1633	455 Diamond	FFID455	FREE FIRE	53200	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1634	4.720 Diamond	FFID4720	FREE FIRE	538171	\N	\N	t	f	2025-10-28 15:27:23.088093	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1635	475 Diamond	FFID475	FREE FIRE	55200	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1636	4.800 Diamond	FFID4800	FREE FIRE	547863	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1637	4.850 Diamond	FFID4850	FREE FIRE	553700	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1638	495 Diamond	FFID495	FREE FIRE	57200	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1639	5 Diamond	FFID5	FREE FIRE	921	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1640	50 Diamond	FFID50	FREE FIRE	6300	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1641	500 Diamond	FFID500	FREE FIRE	57971	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1642	510 Diamond	FFID510	FREE FIRE	59513	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1643	512 Diamond	FFID512	FREE FIRE	59631	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1644	515 Diamond	FFID515	FREE FIRE	60284	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1645	520 Diamond	FFID520	FREE FIRE	61350	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1646	545 Diamond	FFID545	FREE FIRE	63350	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1647	55 Diamond	FFID55	FREE FIRE	7071	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1648	5.500 Diamond	FFID5500	FREE FIRE	627050	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1649	5.600 Diamond	FFID5600	FREE FIRE	639350	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1650	565 Diamond	FFID565	FREE FIRE	65350	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1651	60 Diamond	FFID60	FREE FIRE	7842	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1652	600 Diamond	FFID600	FREE FIRE	70271	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
1653	6.000 Diamond	FFID6000	FREE FIRE	683642	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:47.60383	FFID	0	4.00	hybrid
2756	Voucher Garena 100 Shell (PHP / PHILIPPINES)	GSVPH100	Garena Shell	27500	\N	\N	f	f	2025-11-10 09:43:56.444774	2025-11-10 09:43:56.444774	GSVPH	0	4.00	hybrid
2757	Voucher Garena 200 Shell (PHP / PHILIPPINES)	GSVPH200	Garena Shell	53500	\N	\N	f	f	2025-11-10 09:43:56.444774	2025-11-10 09:43:56.444774	GSVPH	0	4.00	hybrid
2758	Voucher Garena 300 Shell (PHP / PHILIPPINES)	GSVPH300	Garena Shell	79900	\N	\N	f	f	2025-11-10 09:43:56.444774	2025-11-10 09:43:56.444774	GSVPH	0	4.00	hybrid
2759	Voucher Garena 50 Shell (PHP / PHILIPPINES)	GSVPH50	Garena Shell	14500	\N	\N	f	f	2025-11-10 09:43:56.444774	2025-11-10 09:43:56.444774	GSVPH	0	4.00	hybrid
1658	6.550 Diamond	FFID6550	FREE FIRE	741800	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1659	6.900 Diamond	FFID6900	FREE FIRE	786050	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1660	70 Diamond	FFID70	FREE FIRE	8300	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1661	700 Diamond	FFID700	FREE FIRE	81650	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1662	710 Diamond	FFID710	FREE FIRE	81650	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1663	720 Diamond	FFID720	FREE FIRE	81650	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1664	725 Diamond	FFID725	FREE FIRE	82421	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1665	7.290 Diamond	FFID7290	FREE FIRE	821626	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1666	7.295 Diamond	FFID7295	FREE FIRE	822397	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1667	7.310 Diamond	FFID7310	FREE FIRE	824710	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1668	7.340 Diamond	FFID7340	FREE FIRE	827776	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1669	7.360 Diamond	FFID7360	FREE FIRE	829776	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1670	740 Diamond	FFID740	FREE FIRE	84734	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1671	7.430 Diamond	FFID7430	FREE FIRE	837926	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1672	75 Diamond	FFID75	FREE FIRE	9071	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1673	7.645 Diamond	FFID7645	FREE FIRE	862376	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1674	7.650 Diamond	FFID7650	FREE FIRE	863147	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1675	770 Diamond	FFID770	FREE FIRE	87800	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1676	790 Diamond	FFID790	FREE FIRE	89800	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1677	80 Diamond	FFID80	FREE FIRE	9842	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1678	800 Diamond	FFID800	FREE FIRE	91342	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1679	8.010 Diamond	FFID8010	FREE FIRE	903126	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1680	820 Diamond	FFID820	FREE FIRE	93950	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1681	840 Diamond	FFID840	FREE FIRE	95950	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1682	860 Diamond	FFID860	FREE FIRE	97950	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1683	8.730 Diamond	FFID8730	FREE FIRE	984626	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1684	90 Diamond	FFID90	FREE FIRE	11384	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1685	910 Diamond	FFID910	FREE FIRE	104100	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1686	925 Diamond	FFID925	FREE FIRE	106413	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1687	9.290 Diamond	FFID9290	FREE FIRE	1049826	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1688	930 Diamond	FFID930	FREE FIRE	106100	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1689	95 Diamond	FFID95	FREE FIRE	12155	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1690	9.800 Diamond	FFID9800	FREE FIRE	1106876	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFID	0	4.00	hybrid
1829	46 DIAMOND	HGDS46	Hago	14500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HGDS	0	4.00	hybrid
1691	Level Up Pass (Level 10) Region ID	FFLU10	FREE FIRE	7971	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFLU	0	4.00	hybrid
1692	Level Up Pass (Level 15) Region ID	FFLU15	FREE FIRE	7971	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFLU	0	4.00	hybrid
1693	Level Up Pass (Level 20) Region ID	FFLU20	FREE FIRE	7971	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFLU	0	4.00	hybrid
1694	Level Up Pass (Level 25) Region ID	FFLU25	FREE FIRE	7971	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFLU	0	4.00	hybrid
1695	Level Up Pass (Level 30) Region ID	FFLU30	FREE FIRE	12663	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFLU	0	4.00	hybrid
1696	Level Up Pass (Level 6) Region ID	FFLU6	FREE FIRE	4843	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFLU	0	4.00	hybrid
1697	100 Diamond	FFMY100	FREE FIRE	14558	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1698	1060 Diamond	FFMY1060	FREE FIRE	144099	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1699	1080 Diamond	FFMY1080	FREE FIRE	176195	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1700	11500 Diamond	FFMY11500	FREE FIRE	1482898	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1701	210 Diamond	FFMY210	FREE FIRE	35367	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1702	2180 Diamond	FFMY2180	FREE FIRE	290930	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1703	2200 Diamond	FFMY2200	FREE FIRE	352198	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1704	25 Diamond	FFMY25	FREE FIRE	3913	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1705	310 Diamond	FFMY310	FREE FIRE	43932	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1706	400 Diamond	FFMY400	FREE FIRE	60980	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1707	4450 Diamond	FFMY4450	FREE FIRE	711772	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1708	50 Diamond	FFMY50	FREE FIRE	7676	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1709	520 Diamond	FFMY520	FREE FIRE	72612	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1710	530 Diamond	FFMY530	FREE FIRE	88192	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1711	5600 Diamond	FFMY5600	FREE FIRE	719934	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1712	645 Diamond	FFMY645	FREE FIRE	90783	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1713	6900 Diamond	FFMY6900	FREE FIRE	916832	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFMY	0	4.00	hybrid
1714	100 Diamond	FFSG100	FREE FIRE	14558	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFSG	0	4.00	hybrid
1715	1060 Diamond	FFSG1060	FREE FIRE	144099	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFSG	0	4.00	hybrid
1716	1080 Diamond	FFSG1080	FREE FIRE	176195	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFSG	0	4.00	hybrid
1717	11500 Diamond	FFSG11500	FREE FIRE	1482898	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFSG	0	4.00	hybrid
1718	210 Diamond	FFSG210	FREE FIRE	35367	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFSG	0	4.00	hybrid
1719	2180 Diamond	FFSG2180	FREE FIRE	290930	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFSG	0	4.00	hybrid
1720	2200 Diamond	FFSG2200	FREE FIRE	352198	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFSG	0	4.00	hybrid
1722	310 Diamond	FFSG310	FREE FIRE	43932	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFSG	0	4.00	hybrid
1723	400 Diamond	FFSG400	FREE FIRE	60980	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFSG	0	4.00	hybrid
1724	520 Diamond	FFSG520	FREE FIRE	72612	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFSG	0	4.00	hybrid
1725	530 Diamond	FFSG530	FREE FIRE	88192	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFSG	0	4.00	hybrid
1726	5600 Diamond	FFSG5600	FREE FIRE	719934	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FFSG	0	4.00	hybrid
1727	100 FC Points	FMFCP100	FC Mobile	15200	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FMFCP	0	4.00	hybrid
1728	1.070 FC Points	FMFCP1070	FC Mobile	149500	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FMFCP	0	4.00	hybrid
1729	12.000 FC Points	FMFCP12K	FC Mobile	1501600	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FMFCP	0	4.00	hybrid
1730	2.200 FC Points	FMFCP2200	FC Mobile	309200	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FMFCP	0	4.00	hybrid
1731	40 FC Points	FMFCP40	FC Mobile	6500	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FMFCP	0	4.00	hybrid
1732	520 FC Points	FMFCP520	FC Mobile	74500	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FMFCP	0	4.00	hybrid
1733	5.750 FC Points	FMFCP5750	FC Mobile	750500	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FMFCP	0	4.00	hybrid
1734	1.999 Silver	FMSVR1999	FC Mobile	309200	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FMSVR	0	4.00	hybrid
1735	39 Silver	FMSVR39	FC Mobile	6500	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FMSVR	0	4.00	hybrid
1736	499 Silver	FMSVR499	FC Mobile	74500	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FMSVR	0	4.00	hybrid
1737	4.999 Silver	FMSVR4999	FC Mobile	750500	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FMSVR	0	4.00	hybrid
1738	99 Silver	FMSVR99	FC Mobile	15200	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FMSVR	0	4.00	hybrid
1739	999 Silver	FMSVR999	FC Mobile	149500	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FMSVR	0	4.00	hybrid
1740	9.999 Silver	FMSVR9999	FC Mobile	1501600	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	FMSVR	0	4.00	hybrid
1741	Blessing of the Welkin Moon	GIBSWM1	Genshin Impact	59300	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GIBS	0	4.00	hybrid
1742	Blessing of the Welkin Moon x2	GIBSWM2	Genshin Impact	112600	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GIBS	0	4.00	hybrid
1743	Blessing of the Welkin Moon x3	GIBSWM3	Genshin Impact	168900	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GIBS	0	4.00	hybrid
1744	Blessing of the Welkin Moon x4	GIBSWM4	Genshin Impact	224900	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GIBS	0	4.00	hybrid
1745	Blessing of the Welkin Moon x5	GIBSWM5	Genshin Impact	281200	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GIBS	0	4.00	hybrid
1746	1980+260 Chronal Nexus	GICN1980	Genshin Impact	380000	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GICN	0	4.00	hybrid
1830	6 DIAMOND	HGDS6	Hago	2500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HGDS	0	4.00	hybrid
1747	300+30 Chronal Nexus	GICN300	Genshin Impact	59350	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GICN	0	4.00	hybrid
1748	3280+600 Chronal Nexus 	GICN3280	Genshin Impact	625000	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GICN	0	4.00	hybrid
1749	60 Chronal Nexus	GICN60	Genshin Impact	12200	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GICN	0	4.00	hybrid
1750	6480+1600 Chronal Nexus	GICN6480	Genshin Impact	1210000	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GICN	0	4.00	hybrid
1751	980+110 Chronal Nexus	GICN980	Genshin Impact	180000	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GICN	0	4.00	hybrid
1752	1980+260 Genesis Crystals	GICR1980	Genshin Impact	380000	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GICR	0	4.00	hybrid
1753	300+30 Genesis Crystals	GICR300	Genshin Impact	59350	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GICR	0	4.00	hybrid
1754	3280+600 Genesis Crystals 	GICR3280	Genshin Impact	625000	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GICR	0	4.00	hybrid
1755	60 Genesis Crystals	GICR60	Genshin Impact	12200	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GICR	0	4.00	hybrid
1756	6480+1600 Genesis Crystals	GICR6480	Genshin Impact	1210000	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GICR	0	4.00	hybrid
1757	980+110 Genesis Crystals	GICR980	Genshin Impact	180000	\N	\N	t	f	2025-10-28 15:27:29.498007	2025-11-10 09:43:56.444774	GICR	0	4.00	hybrid
1768	120 Gems + 3	GVGM120	Goddess of Victory Nikke	32400	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GVGM	0	4.00	hybrid
1769	1500 Gems + 260	GVGM1500	Goddess of Victory Nikke	304000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GVGM	0	4.00	hybrid
1770	2300 Gems + 400	GVGM2300	Goddess of Victory Nikke	442000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GVGM	0	4.00	hybrid
1771	2370 Gems + 420	GVGM2370	Goddess of Victory Nikke	463000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GVGM	0	4.00	hybrid
1772	320 Gems + 10	GVGM320	Goddess of Victory Nikke	73800	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GVGM	0	4.00	hybrid
1773	4200 Gems + 1000	GVGM4200	Goddess of Victory Nikke	830000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GVGM	0	4.00	hybrid
1774	60 Gems + 1	GVGM60	Goddess of Victory Nikke	15800	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GVGM	0	4.00	hybrid
1775	6200 Gems + 1500	GVGM6200	Goddess of Victory Nikke	1199000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GVGM	0	4.00	hybrid
1776	720 Gems + 120	GVGM720	Goddess of Victory Nikke	148000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GVGM	0	4.00	hybrid
1777	Monthly Pass	GVGMMP	Goddess of Victory Nikke	73900	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GVGM	0	4.00	hybrid
1778	1 Year Subscription Token	GWMS1Y	GROWTOPIA	673000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GWMS	0	4.00	hybrid
1780	Gem Abundance	GWMSGA	GROWTOPIA	673000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GWMS	0	4.00	hybrid
1781	Gem Bounty	GWMSGB	GROWTOPIA	402000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GWMS	0	4.00	hybrid
1782	Gem Fountain	GWMSGF	GROWTOPIA	72000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GWMS	0	4.00	hybrid
1783	Its Rainin Gems	GWMSIRG	GROWTOPIA	135000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GWMS	0	4.00	hybrid
1784	Royal Grow Pass	GWMSRGP	GROWTOPIA	144300	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:43:56.444774	GWMS	0	4.00	hybrid
1801	Memory Recruit Special 3	HFRCM3	HAIKYU FLY HIGH	141500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1802	Memory Recruit Special 4	HFRCM4	HAIKYU FLY HIGH	141500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1803	Recruit Ticket 1	HFRCRT1	HAIKYU FLY HIGH	14200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1804	Recruit Ticket 5	HFRCRT2	HAIKYU FLY HIGH	70600	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1805	Recruit Ticket 10	HFRCRT3	HAIKYU FLY HIGH	183500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1806	Recruit Ticket 20	HFRCRT4	HAIKYU FLY HIGH	423000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1807	Recruit Ticket 30	HFRCRT5	HAIKYU FLY HIGH	705000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1808	Recruit Ticket 55	HFRCRT6	HAIKYU FLY HIGH	1410200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1809	Ultra Recruit Special 1	HFRCU1	HAIKYU FLY HIGH	14200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1810	Ultra Recruit Special 2	HFRCU2	HAIKYU FLY HIGH	70600	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1811	Ultra Recruit Special 3	HFRCU3	HAIKYU FLY HIGH	141500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1812	Ultra Recruit Special 4	HFRCU4	HAIKYU FLY HIGH	211500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1813	Ultra Recruit Ticket 1	HFRCUT1	HAIKYU FLY HIGH	14200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1814	Ultra Recruit Ticket 2	HFRCUT2	HAIKYU FLY HIGH	70600	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1815	Ultra Recruit Ticket 3	HFRCUT3	HAIKYU FLY HIGH	183500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1816	Ultra Recruit Ticket 4	HFRCUT4	HAIKYU FLY HIGH	423000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1817	Ultra Recruit Ticket 5	HFRCUT5	HAIKYU FLY HIGH	705000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1818	Ultra Recruit Ticket 6	HFRCUT6	HAIKYU FLY HIGH	1410200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFRC	0	4.00	hybrid
1820	300 Star Gems	HFSG300	HAIKYU FLY HIGH	78200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFSG	0	4.00	hybrid
1821	3.280 Star Gems	HFSG3280	HAIKYU FLY HIGH	783200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFSG	0	4.00	hybrid
1822	60 Star Gems	HFSG60	HAIKYU FLY HIGH	15500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFSG	0	4.00	hybrid
1823	6.480 Star Gems	HFSG6480	HAIKYU FLY HIGH	1566500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFSG	0	4.00	hybrid
1824	980 Star Gems	HFSG980	HAIKYU FLY HIGH	234800	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HFSG	0	4.00	hybrid
1825	1.680 DIAMOND	HGDS1680	Hago	510250	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HGDS	0	4.00	hybrid
1826	228 DIAMOND	HGDS228	Hago	69600	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HGDS	0	4.00	hybrid
1827	3.362 DIAMOND	HGDS3362	Hago	1025000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HGDS	0	4.00	hybrid
1828	381 DIAMOND	HGDS381	Hago	116500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HGDS	0	4.00	hybrid
1831	91 DIAMOND	HGDS91	Hago	28500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HGDS	0	4.00	hybrid
1832	915 DIAMOND	HGDS915	Hago	279500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HGDS	0	4.00	hybrid
1833	1.320 B-Chips	HIBC1320	Honkai Impact 3	320000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HIBC	0	4.00	hybrid
1834	1.980 B-Chips	HIBC1980	Honkai Impact 3	465000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HIBC	0	4.00	hybrid
1835	30 B-Chips	HIBC30	Honkai Impact 3	8000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HIBC	0	4.00	hybrid
1836	330 B-Chips	HIBC330	Honkai Impact 3	77200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HIBC	0	4.00	hybrid
1837	3.300 B-Chips	HIBC3300	Honkai Impact 3	772000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HIBC	0	4.00	hybrid
1838	65 B-Chips	HIBC65	Honkai Impact 3	16000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HIBC	0	4.00	hybrid
1839	6.600 B-Chips	HIBC6600	Honkai Impact 3	1545900	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HIBC	0	4.00	hybrid
1840	990 B-Chips	HIBC990	Honkai Impact 3	243000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HIBC	0	4.00	hybrid
1841	1.320 Crystals	HICR1320	Honkai Impact 3	316600	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HICR	0	4.00	hybrid
1842	330 Crystals	HICR330	Honkai Impact 3	77200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HICR	0	4.00	hybrid
1843	3.300 Crystals	HICR3300	Honkai Impact 3	774000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HICR	0	4.00	hybrid
1844	65 Crystals	HICR65	Honkai Impact 3	16000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HICR	0	4.00	hybrid
1845	660 Crystals	HICR660	Honkai Impact 3	154000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HICR	0	4.00	hybrid
1846	6.600 Crystals	HICR6600	Honkai Impact 3	1545900	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HICR	0	4.00	hybrid
1847	Monthly Card	HISIMC	Honkai Impact 3	78500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HISI	0	4.00	hybrid
1848	Weekly Card	HKCDWC	Honor Of Kings	11500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HKCD	0	4.00	hybrid
1849	Weekly Card Plus	HKCDWCP	Honor Of Kings	38800	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HKCD	0	4.00	hybrid
1850	1.200 + 45 Tokens	HKTO1200	Honor Of Kings	182400	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HKTO	0	4.00	hybrid
1851	16 Tokens	HKTO16	Honor Of Kings	2700	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HKTO	0	4.00	hybrid
1852	23 Tokens 	HKTO23	Honor Of Kings	4000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HKTO	0	4.00	hybrid
1853	240 Tokens	HKTO240	Honor Of Kings	38800	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HKTO	0	4.00	hybrid
1854	2.400 + 108 Tokens	HKTO2400	Honor Of Kings	394250	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HKTO	0	4.00	hybrid
1855	400 Tokens 	HKTO400	Honor Of Kings	65900	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HKTO	0	4.00	hybrid
1856	4.000 + 180 Tokens	HKTO4000	Honor Of Kings	657000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HKTO	0	4.00	hybrid
1857	560 Tokens	HKTO560	Honor Of Kings	89800	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HKTO	0	4.00	hybrid
1858	8 Tokens	HKTO8	Honor Of Kings	1600	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HKTO	0	4.00	hybrid
1859	80 Tokens	HKTO80	Honor Of Kings	11500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HKTO	0	4.00	hybrid
1860	800  + 30 Tokens 	HKTO800	Honor Of Kings	113800	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HKTO	0	4.00	hybrid
1861	8.000 + 360 Tokens	HKTO8000	Honor Of Kings	1131800	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HKTO	0	4.00	hybrid
1862	1280+270 Jewels	HPJW1280	Harry Potter Magic Awakening	250000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HPJW	0	4.00	hybrid
1863	1980+380 Jewels	HPJW1980	Harry Potter Magic Awakening	375000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HPJW	0	4.00	hybrid
1864	300 Jewels	HPJW300	Harry Potter Magic Awakening	62800	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HPJW	0	4.00	hybrid
1865	3280+780 Jewels	HPJW3280	Harry Potter Magic Awakening	619500	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HPJW	0	4.00	hybrid
1866	60 Jewels	HPJW60	Harry Potter Magic Awakening	13200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HPJW	0	4.00	hybrid
1867	6480+2000 Jewels	HPJW6480	Harry Potter Magic Awakening	1240250	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HPJW	0	4.00	hybrid
1868	680+70 Jewels	HPJW680	Harry Potter Magic Awakening	125000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HPJW	0	4.00	hybrid
1869	980+165 Jewels	HPJW980	Harry Potter Magic Awakening	195000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HPJW	0	4.00	hybrid
1883	1200 Gems + 90 Master Keys	HUGM1200G	Heroic Uncle Kim	51400	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HUGM	0	4.00	hybrid
1884	150 Demon Coins + 300 Master Keys	HUGM150DC	Heroic Uncle Kim	51400	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HUGM	0	4.00	hybrid
1885	16000 Gems + 1000 Master Keys	HUGM16KG	Heroic Uncle Kim	464000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HUGM	0	4.00	hybrid
1886	220 Gems + 20 Master Keys	HUGM220G	Heroic Uncle Kim	11200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HUGM	0	4.00	hybrid
1887	2400 Gems + 150 Master Keys	HUGM2400G	Heroic Uncle Kim	95000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HUGM	0	4.00	hybrid
1888	36000 Gems + 2000 Master Keys	HUGM36KG	Heroic Uncle Kim	935000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HUGM	0	4.00	hybrid
1889	8500 Gems + 500 Master keys	HUGM8500G	Heroic Uncle Kim	275000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HUGM	0	4.00	hybrid
1890	950 Dragon Orbs	HUGM950DO	Heroic Uncle Kim	95000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HUGM	0	4.00	hybrid
1891	95 Demon Coins + 150 Master Keys	HUGM95DC	Heroic Uncle Kim	34200	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HUGM	0	4.00	hybrid
1892	Ads Pass 30 Days + 240 Gems	HUGMAP	Heroic Uncle Kim	95000	\N	\N	t	f	2025-10-28 15:27:35.693269	2025-11-10 09:44:05.573155	HUGM	0	4.00	hybrid
2675	Voucher Standard 1 Month	IQST30	IQIYI	16000	\N	\N	t	f	2025-11-01 21:51:17.927916	2025-11-10 09:44:05.573155	IQST	0	4.00	hybrid
2676	Voucher Standard 1 Year	IQST365	IQIYI	153000	\N	\N	t	f	2025-11-01 21:51:17.927916	2025-11-10 09:44:05.573155	IQST	0	4.00	hybrid
2677	Voucher Standard 1 Week	IQST7	IQIYI	9000	\N	\N	t	f	2025-11-01 21:51:17.927916	2025-11-10 09:44:05.573155	IQST	0	4.00	hybrid
2678	Voucher Standard 3 Months	IQST90	IQIYI	44000	\N	\N	t	f	2025-11-01 21:51:17.927916	2025-11-10 09:44:05.573155	IQST	0	4.00	hybrid
1893	185 Echoes	IVEC185	Identity V	37500	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	IVEC	0	4.00	hybrid
1894	2025 Echoes	IVEC2025	Identity V	370000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	IVEC	0	4.00	hybrid
1895	305 Echoes	IVEC305	Identity V	62600	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	IVEC	0	4.00	hybrid
1896	3330 Echoes	IVEC3330	Identity V	617500	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	IVEC	0	4.00	hybrid
1897	60 Echoes	IVEC60	Identity V	13000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	IVEC	0	4.00	hybrid
1898	6590 Echoes	IVEC6590	Identity V	1235700	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	IVEC	0	4.00	hybrid
1899	690 Echoes	IVEC690	Identity V	124500	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	IVEC	0	4.00	hybrid
1900	Clues Package	IVPCCP	Identity V	62700	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	IVPC	0	4.00	hybrid
1901	Inspirations Package	IVPCIP	Identity V	13000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	IVPC	0	4.00	hybrid
1902	Memory Sphere Package 	IVPCMSP	Identity V	124500	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	IVPC	0	4.00	hybrid
1903	10 Diamonds	KCDM10	Kings Choice	6500	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	KCDM	0	4.00	hybrid
1904	132  Diamonds	KCDM132	Kings Choice	78200	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	KCDM	0	4.00	hybrid
1905	1.360  Diamonds	KCDM1360	Kings Choice	781000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	KCDM	0	4.00	hybrid
1906	26  Diamonds	KCDM26	Kings Choice	16000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	KCDM	0	4.00	hybrid
1907	268  Diamonds	KCDM268	Kings Choice	157000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	KCDM	0	4.00	hybrid
1908	2.750  Diamonds	KCDM2750	Kings Choice	1554000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	KCDM	0	4.00	hybrid
1909	810  Diamonds	KCDM810	Kings Choice	468000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:05.573155	KCDM	0	4.00	hybrid
2169	100 Diamonds	L2DM100	Lineage2M	25500	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2DM	0	4.00	hybrid
2170	120 Diamonds	L2DM120	Lineage2M	30500	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2DM	0	4.00	hybrid
2171	1.000 Diamonds	L2DM1K	Lineage2M	253600	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2DM	0	4.00	hybrid
2172	1.200 Diamonds	L2DM1K2	Lineage2M	305000	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2DM	0	4.00	hybrid
2173	200 Diamonds	L2DM200	Lineage2M	50800	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2DM	0	4.00	hybrid
2174	2.000 Diamonds	L2DM2K	Lineage2M	507500	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2DM	0	4.00	hybrid
2175	40 Diamonds	L2DM40	Lineage2M	10500	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2DM	0	4.00	hybrid
2176	400 Diamonds	L2DM400	Lineage2M	101500	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2DM	0	4.00	hybrid
2177	2.000 Diamonds	L2DM4K	Lineage2M	1025000	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2DM	0	4.00	hybrid
2178	Weekly Top-up Agathion Benefits 1 	L2PCAB1	Lineage2M	10500	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2PC	0	4.00	hybrid
2179	Weekly Top-up Agathion Benefits 2	L2PCAB2	Lineage2M	15500	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2PC	0	4.00	hybrid
2180	Weekly Top-up Agathion Benefits 3	L2PCAB3	Lineage2M	25500	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2PC	0	4.00	hybrid
2181	Weekly Top-up Class Benefits 1	L2PCCB1	Lineage2M	10500	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2PC	0	4.00	hybrid
2182	Weekly Top-up Class Benefits 2	L2PCCB2	Lineage2M	15500	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2PC	0	4.00	hybrid
2183	Weekly Top-up Class Benefits 3	L2PCCB3	Lineage2M	25500	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2PC	0	4.00	hybrid
2184	Daily Package 1	L2PCDP1	Lineage2M	10500	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2PC	0	4.00	hybrid
2185	Daily Package 2	L2PCDP2	Lineage2M	10500	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2PC	0	4.00	hybrid
2186	Daily Package 3	L2PCDP3	Lineage2M	10500	\N	\N	t	f	2025-10-28 17:17:53.377941	2025-11-10 09:44:14.433895	L2PC	0	4.00	hybrid
1925	Top Up Link Aja 35.000	LA35	LifeAfter	35325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1926	Top Up Link Aja 40.000	LA40	LifeAfter	40325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1927	Top Up Link Aja 400.000	LA400	LifeAfter	400375	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1928	Top Up Link Aja 45.000	LA45	LifeAfter	45325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1929	Top Up Link Aja 50.000	LA50	LifeAfter	50325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1930	Top Up Link Aja 500.000	LA500	LifeAfter	500425	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1931	Top Up Link Aja 55.000	LA55	LifeAfter	55325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1932	Top Up Link Aja 60.000 	LA60	LifeAfter	60325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1933	Top Up Link Aja 65.000	LA65	LifeAfter	65325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1934	Top Up Link Aja 70.000 	LA70	LifeAfter	70325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1935	Top Up Link Aja 75.000	LA75	LifeAfter	75325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1936	Top Up Link Aja 80.000	LA80	LifeAfter	80325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1937	Top Up Link Aja 85.000	LA85	LifeAfter	85325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1938	Top Up Link Aja 90.000	LA90	LifeAfter	90325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1939	Top Up Link Aja 95.000	LA95	LifeAfter	95325	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LACR	0	4.00	hybrid
1940	1,000 + 50 Coins	LECO1000	Land of Empires	160000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LECO	0	4.00	hybrid
1941	2,000 + 100 Coins	LECO2000	Land of Empires	315000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LECO	0	4.00	hybrid
1942	500 Coins	LECO500	Land of Empires	80000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LECO	0	4.00	hybrid
1943	5,000 + 250 Coins	LECO5000	Land of Empires	800000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LECO	0	4.00	hybrid
1944	130 Token	LFTO130	Legacy Fate Sacred and Fearless	35000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LFTO	0	4.00	hybrid
1945	1.410 Token	LFTO1410	Legacy Fate Sacred and Fearless	337000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LFTO	0	4.00	hybrid
1946	2.180 Token	LFTO2180	Legacy Fate Sacred and Fearless	480000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LFTO	0	4.00	hybrid
1947	330 Token	LFTO330	Legacy Fate Sacred and Fearless	86000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LFTO	0	4.00	hybrid
1948	3.610 Token	LFTO3610	Legacy Fate Sacred and Fearless	816000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LFTO	0	4.00	hybrid
1949	70 Token	LFTO70	Legacy Fate Sacred and Fearless	20000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LFTO	0	4.00	hybrid
1950	7.130 Token	LFTO7130	Legacy Fate Sacred and Fearless	1700000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LFTO	0	4.00	hybrid
1951	750 Token	LFTO750	Legacy Fate Sacred and Fearless	163000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LFTO	0	4.00	hybrid
1952	990 Token	LFTO990	Legacy Fate Sacred and Fearless	240000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LFTO	0	4.00	hybrid
1953	1.000 Cores	LLID1000	League of Legends Wild Rift	132000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLID	0	4.00	hybrid
1954	10.000 Cores	LLID10000	League of Legends Wild Rift	1125000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLID	0	4.00	hybrid
1955	1.850 Cores	LLID1850	League of Legends Wild Rift	262000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLID	0	4.00	hybrid
1956	3.275 Cores	LLID3275	League of Legends Wild Rift	410000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLID	0	4.00	hybrid
1957	425 Cores	LLID425	League of Legends Wild Rift	56700	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLID	0	4.00	hybrid
1958	4.800 Cores	LLID4800	League of Legends Wild Rift	579500	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLID	0	4.00	hybrid
1959	1.000 Cores	LLMY1000	League of Legends Wild Rift	156800	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLMY	0	4.00	hybrid
1960	10.000 Cores	LLMY100000	League of Legends Wild Rift	1432000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLMY	0	4.00	hybrid
1961	1.850 Cores	LLMY1850	League of Legends Wild Rift	286200	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLMY	0	4.00	hybrid
1962	3.275 Cores	LLMY3275	League of Legends Wild Rift	500800	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLMY	0	4.00	hybrid
1963	425 Cores 	LLMY425	League of Legends Wild Rift	71600	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLMY	0	4.00	hybrid
1964	4.800 Cores	LLMY4800	League of Legends Wild Rift	715200	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLMY	0	4.00	hybrid
1971	1.000 Wild Cores	LLPH1000	League of Legends Wild Rift	125800	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLPH	0	4.00	hybrid
1972	10.000 Wild Cores	LLPH10000	League of Legends Wild Rift	1141000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLPH	0	4.00	hybrid
1975	1.850 Wild Cores	LLPH1850	League of Legends Wild Rift	229000	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLPH	0	4.00	hybrid
1977	3.275 Wild Cores	LLPH3275	League of Legends Wild Rift	399500	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLPH	0	4.00	hybrid
1978	425 Wild Cores	LLPH425	League of Legends Wild Rift	56400	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLPH	0	4.00	hybrid
1980	4.800 Wild Cores	LLPH4800	League of Legends Wild Rift	572500	\N	\N	t	f	2025-10-28 15:27:45.72839	2025-11-10 09:44:14.433895	LLPH	0	4.00	hybrid
1983	1.999 Gems + Bonus Items	LMDO1999	Legend of Mushroom Rush	273000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:14.433895	LMDO	0	4.00	hybrid
1984	29.999 Gems + Bonus Items	LMDO29K	Legend of Mushroom Rush	4100500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:14.433895	LMDO	0	4.00	hybrid
1985	499 Gems + Bonus Items	LMDO499	Legend of Mushroom Rush	69000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:14.433895	LMDO	0	4.00	hybrid
1986	4.999 Gems + Bonus Items	LMDO4999	Legend of Mushroom Rush	680000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:14.433895	LMDO	0	4.00	hybrid
1987	59.999 Gems + Bonus Items	LMDO59K	Legend of Mushroom Rush	8202500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:14.433895	LMDO	0	4.00	hybrid
1988	99 Gems + Bonus Items	LMDO99	Legend of Mushroom Rush	15000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:14.433895	LMDO	0	4.00	hybrid
1989	999 Gems + Bonus Items	LMDO999	Legend of Mushroom Rush	138000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:14.433895	LMDO	0	4.00	hybrid
1990	9.999 Gems + Bonus Items	LMDO9999	Legend of Mushroom Rush	1380000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:14.433895	LMDO	0	4.00	hybrid
2196	1.000 Coins	LRID1000	Legends of Runeterra	105000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRID	0	4.00	hybrid
2197	11.000 Coins	LRID11K	Legends of Runeterra	1030000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRID	0	4.00	hybrid
2198	2.050 Coins	LRID2050	Legends of Runeterra	210000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRID	0	4.00	hybrid
2199	3.650 Coins	LRID3650	Legends of Runeterra	363000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRID	0	4.00	hybrid
2200	475 Coins	LRID475	Legends of Runeterra	53000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRID	0	4.00	hybrid
2201	5.350 Coins	LRID5350	Legends of Runeterra	52000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRID	0	4.00	hybrid
2202	1.000 Coins	LRMY1000	Legends of Runeterra	150000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRMY	0	4.00	hybrid
2203	11.000 Coins	LRMY11K	Legends of Runeterra	1428000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRMY	0	4.00	hybrid
2204	2.050 Coins	LRMY2050	Legends of Runeterra	287000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRMY	0	4.00	hybrid
2205	3.650 Coins	LRMY3650	Legends of Runeterra	500000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRMY	0	4.00	hybrid
2206	475 Coins	LRMY475	Legends of Runeterra	71500	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRMY	0	4.00	hybrid
2207	5.350 Coins	LRMY5350	Legends of Runeterra	715000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRMY	0	4.00	hybrid
2208	1.000 Coins	LRPH1000	Legends of Runeterra	150000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRPH	0	4.00	hybrid
2209	11.000 Coins	LRPH11K	Legends of Runeterra	1428000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRPH	0	4.00	hybrid
2210	2.050 Coins	LRPH2050	Legends of Runeterra	287000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRPH	0	4.00	hybrid
2211	3.650 Coins	LRPH3650	Legends of Runeterra	500000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRPH	0	4.00	hybrid
2212	475 Coins	LRPH475	Legends of Runeterra	71500	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRPH	0	4.00	hybrid
2213	5.350 Coins	LRPH5350	Legends of Runeterra	715000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LRPH	0	4.00	hybrid
2214	1.350 Crystals	LTCY1350	Light of Thel New Era	185500	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LTCY	0	4.00	hybrid
2215	15.000 Crystals	LTCY15000	Light of Thel New Era	1847000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LTCY	0	4.00	hybrid
2216	1.800 Crystals	LTCY1800	Light of Thel New Era	247000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LTCY	0	4.00	hybrid
2217	2.250 Crystals	LTCY2250	Light of Thel New Era	309000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:14.433895	LTCY	0	4.00	hybrid
2252	10.022 Badges	M2BD10K	MU Origin 2	1110000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2BD	0	4.00	hybrid
2253	115 Badges	M2BD115	MU Origin 2	12800	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2BD	0	4.00	hybrid
2254	1.297 Badges	M2BD1297	MU Origin 2	142600	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2BD	0	4.00	hybrid
2255	1.907 Badges	M2BD1907	MU Origin 2	209500	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2BD	0	4.00	hybrid
2256	20.005 Badges	M2BD20K	MU Origin 2	2210000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2BD	0	4.00	hybrid
2257	2.288 Badges	M2BD2288	MU Origin 2	252500	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2BD	0	4.00	hybrid
2258	23 Badges	M2BD23	MU Origin 2	3000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2BD	0	4.00	hybrid
2259	267 Badges	M2BD267	MU Origin 2	29500	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2BD	0	4.00	hybrid
2260	30.011 Badges	M2BD30K	MU Origin 2	3320000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2BD	0	4.00	hybrid
2261	40.002 Badges	M2BD40K	MU Origin 2	4420000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2BD	0	4.00	hybrid
2262	488 Badges	M2BD488	MU Origin 2	54000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2BD	0	4.00	hybrid
2263	50.016 Badges	M2BD50K	MU Origin 2	5520000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2BD	0	4.00	hybrid
2264	61 Badges	M2BD61	MU Origin 2	7000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2BD	0	4.00	hybrid
2265	6.482 Badges	M2BD6482	MU Origin 2	730000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2BD	0	4.00	hybrid
2266	839 Badges	M2BD839	MU Origin 2	92500	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2BD	0	4.00	hybrid
2267	110 Diamonds	M2DD110	MU Origin 2	13700	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2DD	0	4.00	hybrid
2268	1.236 Diamonds	M2DD1236	MU Origin 2	151000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2DD	0	4.00	hybrid
2269	1.786 Diamonds	M2DD1786	MU Origin 2	218500	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2DD	0	4.00	hybrid
2270	2.403 Diamonds	M2DD2403	MU Origin 2	295000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2DD	0	4.00	hybrid
2271	248 Diamonds	M2DD248	MU Origin 2	30300	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2DD	0	4.00	hybrid
2272	28 Diamonds	M2DD28	MU Origin 2	3700	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2DD	0	4.00	hybrid
2273	447 Diamonds	M2DD447	MU Origin 2	54700	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2DD	0	4.00	hybrid
2274	59 Diamonds	M2DD59	MU Origin 2	7500	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2DD	0	4.00	hybrid
2275	6.130 Diamonds	M2DD6130	MU Origin 2	755000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2DD	0	4.00	hybrid
2276	824 Diamonds	M2DD824	MU Origin 2	101000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M2DD	0	4.00	hybrid
2277	1.050 Divine Diamonds	M31050	MU Origin 3	211000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M3DD	0	4.00	hybrid
2278	2.100 Divine Diamonds	M32100	MU Origin 3	419000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M3DD	0	4.00	hybrid
2279	350 Divine Diamonds	M3350	MU Origin 3	70000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M3DD	0	4.00	hybrid
2280	3.500 Divine Diamonds	M33500	MU Origin 3	699000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M3DD	0	4.00	hybrid
2281	70 Divine Diamonds	M370	MU Origin 3	14000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M3DD	0	4.00	hybrid
2282	7.000 Divine Diamonds	M37000	MU Origin 3	1401000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	M3DD	0	4.00	hybrid
2283	1.300 Ruby	MAID1300	METAL SLUG AWAKENING	229500	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2284	310 Ruby	MAID310	METAL SLUG AWAKENING	58900	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2285	3.200 Ruby	MAID3200	METAL SLUG AWAKENING	588200	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2286	60 ruby	MAID60	METAL SLUG AWAKENING	13000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2287	630 Ruby	MAID630	METAL SLUG AWAKENING	116000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2288	6.500 Ruby	MAID6500	METAL SLUG AWAKENING	1195000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2289	Alloy Pickaxe x1	MAIDAP1	METAL SLUG AWAKENING	23000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2290	Alloy Pickaxe x10	MAIDAP10	METAL SLUG AWAKENING	225000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2291	Alloy Pickaxe x20	MAIDAP20	METAL SLUG AWAKENING	450000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2292	Monthly Card	MAIDMC	METAL SLUG AWAKENING	59000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2293	Monthly Card 3 Bulan	MAIDMC3	METAL SLUG AWAKENING	170000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2294	Premium Monthly Card	MAIDPMC	METAL SLUG AWAKENING	118000	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2295	Premium Monthly Card 3 Bulan	MAIDPMC3	METAL SLUG AWAKENING	348800	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2296	Premium Support Pass	MAIDPSP	METAL SLUG AWAKENING	113500	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2297	Ruby Pickaxe x1	MAIDRP1	METAL SLUG AWAKENING	27500	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2298	Ruby Pickaxe x10	MAIDRP10	METAL SLUG AWAKENING	270500	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2299	Ruby Pickaxe x20	MAIDRP20	METAL SLUG AWAKENING	540200	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2300	Sapphire Pickaxe x1	MAIDSP1	METAL SLUG AWAKENING	27500	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2301	Sapphire Pickaxe x10	MAIDSP10	METAL SLUG AWAKENING	270500	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2302	Sapphire Pickaxe x20	MAIDSP20	METAL SLUG AWAKENING	540200	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2303	Support Pass	MAIDSSP	METAL SLUG AWAKENING	58900	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MAID	0	4.00	hybrid
2304	Account Growth Fund(Advanced) 	MBPPAGFA	MOB RUSH	121800	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MBPP	0	4.00	hybrid
2305	Account Growth Fund(Normal)	MBPPAGFN	MOB RUSH	46300	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MBPP	0	4.00	hybrid
2306	BattlePass	MBPPBP	MOB RUSH	76500	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MBPP	0	4.00	hybrid
2307	Diamond Benefits Monthly	MBPPDBM	MOB RUSH	37300	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MBPP	0	4.00	hybrid
2308	Diamond Benefits Weekly	MBPPDBW	MOB RUSH	19200	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MBPP	0	4.00	hybrid
2309	Super Value Hero Pack	MBPPSVHP	MOB RUSH	16100	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MBPP	0	4.00	hybrid
2310	Top Value Pack	MBPPTVP	MOB RUSH	5500	\N	\N	t	f	2025-10-29 19:58:46.510955	2025-11-10 09:44:23.256984	MBPP	0	4.00	hybrid
2243	300 Diamonds (150+150)	MCIDF300	Magic Chess Go Go	37000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDF	0	4.00	hybrid
2244	500 Diamonds (250+250)	MCIDF500	Magic Chess Go Go	61500	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDF	0	4.00	hybrid
2245	Weekly Card (One Time)	MCIDWWC1	Magic Chess Go Go	30000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MCIDW	0	4.00	hybrid
2246	120 Stardust + 120 Iso-gems	MDSD120	MARVEL Duel	253000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MDSD	0	4.00	hybrid
2247	30 Stardust + 10 Iso-gems	MDSD30	MARVEL Duel	63000	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MDSD	0	4.00	hybrid
2248	300 Stardust + 400 Iso-gems	MDSD300	MARVEL Duel	623100	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MDSD	0	4.00	hybrid
2249	6 Stardust	MDSD6	MARVEL Duel	13200	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MDSD	0	4.00	hybrid
2250	60 Stardust + 40 Iso-gems	MDSD60	MARVEL Duel	128600	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MDSD	0	4.00	hybrid
2251	600 Stardust + 860 Iso-gems	MDSD600	MARVEL Duel	1245500	\N	\N	t	f	2025-10-28 17:17:59.744119	2025-11-10 09:44:23.256984	MDSD	0	4.00	hybrid
2021	390 + 39 Diamond	MLBR429	MOBILE LEGENDS	99900	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2022	468 + 46 Diamond	MLBR514	MOBILE LEGENDS	119800	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2023	546 + 54 Diamond	MLBR600	MOBILE LEGENDS	140225	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2024	625 + 81 Diamond	MLBR706	MOBILE LEGENDS	160500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2025	703 + 89 Diamond	MLBR792	MOBILE LEGENDS	181445	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2026	78 + 8 Diamond 	MLBR86	MOBILE LEGENDS	20500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2027	781 + 97 Diamond	MLBR878	MOBILE LEGENDS	202250	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2028	963 Diamonds (859 + 104 Bonus)	MLBR963	MOBILE LEGENDS	220800	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLBR	0	4.00	hybrid
2029	9 + 1 Diamond	MLID10	MOBILE LEGENDS	3220	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2030	100 Diamond	MLID100	MOBILE LEGENDS	26600	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2031	102 + 10 Diamond 	MLID112	MOBILE LEGENDS	29700	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2032	1.003 + 156 Diamond 	MLID1159	MOBILE LEGENDS	292500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2033	11 + 1 Diamond	MLID12	MOBILE LEGENDS	4000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2034	13 + 1 Diamond	MLID14	MOBILE LEGENDS	4200	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2035	127 + 13 Diamond 	MLID140	MOBILE LEGENDS	37500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2036	1.250 + 162 Diamond 	MLID1412	MOBILE LEGENDS	361000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2037	15 Diamond 	MLID15	MOBILE LEGENDS	4450	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2038	140 + 13 Diamond 	MLID153	MOBILE LEGENDS	40500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2039	156 + 16 Diamond 	MLID172	MOBILE LEGENDS	45500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2040	1.629 + 201 Diamond 	MLID1830	MOBILE LEGENDS	468400	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2041	167 + 18 Diamond 	MLID185	MOBILE LEGENDS	48700	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2042	17 + 2 Diamond 	MLID19	MOBILE LEGENDS	5500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2043	1.793 + 217 Diamond 	MLID2010	MOBILE LEGENDS	478800	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2044	1.860 + 335 Diamond 	MLID2195	MOBILE LEGENDS	530500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2045	17 + 5 Diamond 	MLID22	MOBILE LEGENDS	6500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2046	222 + 18 Diamond	MLID240	MOBILE LEGENDS	62500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2047	254 + 25 Diamond 	MLID279	MOBILE LEGENDS	73200	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2048	25 + 3 Diamond 	MLID28	MOBILE LEGENDS	8000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2049	254 + 28 Diamond 	MLID282	MOBILE LEGENDS	74900	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2050	256 + 40 Diamond 	MLID296	MOBILE LEGENDS	76200	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2051	3 Diamond	MLID3	MOBILE LEGENDS	1100	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2052	28 + 5 Diamond 	MLID33	MOBILE LEGENDS	10100	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2053	306 + 30 Diamond 	MLID336	MOBILE LEGENDS	88900	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2054	312 + 32 Diamond 	MLID344	MOBILE LEGENDS	90700	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2055	306 + 40 Diamond 	MLID350	MOBILE LEGENDS	92700	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2056	33 + 3 Diamond 	MLID36	MOBILE LEGENDS	10200	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2057	330 + 36 Diamond 	MLID366	MOBILE LEGENDS	96200	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2058	333 + 37 Diamond 	MLID370	MOBILE LEGENDS	97058	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2059	352 + 28 Diamond 	MLID380	MOBILE LEGENDS	100500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2060	367 + 41 Diamond 	MLID408	MOBILE LEGENDS	105800	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2061	378 + 37 Diamond 	MLID415	MOBILE LEGENDS	109600	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2062	38 + 4 Diamond 	MLID42	MOBILE LEGENDS	12100	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2063	383 + 46 Diamond 	MLID429	MOBILE LEGENDS	113500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2064	411 + 37 Diamond 	MLID448	MOBILE LEGENDS	117500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2065	43 + 2 Diamond 	MLID45	MOBILE LEGENDS	12900	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2066	421 + 39 Diamond 	MLID460	MOBILE LEGENDS	120800	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2067	5 Diamond	MLID5	MOBILE LEGENDS	1600	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2068	46 + 4 Diamond 	MLID50	MOBILE LEGENDS	13900	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2069	465 + 49 Diamond 	MLID514	MOBILE LEGENDS	134500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2070	51 + 5 Diamond 	MLID56	MOBILE LEGENDS	15200	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2071	519 + 49 Diamond 	MLID568	MOBILE LEGENDS	146500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2072	53 + 6 Diamond 	MLID59	MOBILE LEGENDS	16000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:23.256984	MLID	0	4.00	hybrid
2084	82 + 7 Diamond 	MLID89	MOBILE LEGENDS	23830	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLID	0	4.00	hybrid
2085	859 + 104 Diamond 	MLID963	MOBILE LEGENDS	248900	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLID	0	4.00	hybrid
2086	Weekly Diamond Pass Region BR	MLMSBR1	MOBILE LEGENDS	26000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLMS	0	4.00	hybrid
2087	Weekly Diamond Pass x2 Region BR	MLMSBR2	MOBILE LEGENDS	51500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLMS	0	4.00	hybrid
2088	Weekly Diamond Pass x3 Region BR	MLMSBR3	MOBILE LEGENDS	77000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLMS	0	4.00	hybrid
2089	Weekly Diamond Pass x4 Region BR	MLMSBR4	MOBILE LEGENDS	102500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLMS	0	4.00	hybrid
2090	Weekly Diamond Pass x5 Region BR	MLMSBR5	MOBILE LEGENDS	128000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLMS	0	4.00	hybrid
2091	Weekly Diamond Pass Region ID	MLMSID1	MOBILE LEGENDS	28077	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLMS	0	4.00	hybrid
2092	Weekly Diamond Pass 2x Region ID	MLMSID2	MOBILE LEGENDS	55000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLMS	0	4.00	hybrid
2093	Weekly Diamond Pass 3x Region ID	MLMSID3	MOBILE LEGENDS	82400	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLMS	0	4.00	hybrid
2094	Weekly Diamond Pass 4x Region ID	MLMSID4	MOBILE LEGENDS	109500	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLMS	0	4.00	hybrid
2095	Weekly Diamond Pass 5x Region ID	MLMSID5	MOBILE LEGENDS	136900	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLMS	0	4.00	hybrid
2096	Weekly Diamond Pass Region MY	MLMSMY1	MOBILE LEGENDS	36000	\N	\N	t	f	2025-10-28 15:27:51.640841	2025-11-10 09:44:33.292695	MLMS	0	4.00	hybrid
2682	Voucher Nintendo 50$ 	NNUSD50	Nintendo Eshop	753200	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:33.292695	NNUSD	0	4.00	hybrid
2683	Voucher Gift Card 0.99 USD	NPGUS1	Netease Pay	16000	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:33.292695	NPGUS	0	4.00	hybrid
2684	Voucher Gift Card 10 USD	NPGUS10	Netease Pay	152165	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:33.292695	NPGUS	0	4.00	hybrid
2685	Voucher Gift Card 100 USD	NPGUS100	Netease Pay	1494494	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:33.292695	NPGUS	0	4.00	hybrid
2686	Voucher Gift Card 15 USD	NPGUS15	Netease Pay	226774	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:33.292695	NPGUS	0	4.00	hybrid
2687	Voucher Gift Card 20 USD	NPGUS20	Netease Pay	301291	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:33.292695	NPGUS	0	4.00	hybrid
2688	Voucher Gift Card 25 USD	NPGUS25	Netease Pay	375873	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:33.292695	NPGUS	0	4.00	hybrid
2689	Voucher Gift Card 5 USD	NPGUS5	Netease Pay	77582	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:33.292695	NPGUS	0	4.00	hybrid
2690	Voucher Gift Card 50 USD	NPGUS50	Netease Pay	748786	\N	\N	t	f	2025-11-01 21:51:40.358361	2025-11-10 09:44:33.292695	NPGUS	0	4.00	hybrid
2324	6.480 Jade	OAJA6480	Onmyoji Arena	1180000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	OAJA	0	4.00	hybrid
2325	680 Jade	OAJA680	Onmyoji Arena	120000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	OAJA	0	4.00	hybrid
2326	1.120 (Crystgin)	OHCG1120	Once Human	224000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	OHCG	0	4.00	hybrid
2327	2.340 (Crystgin)	OHCG2340	Once Human	455000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	OHCG	0	4.00	hybrid
2328	339 (Crystgin)	OHCG339	Once Human	75000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	OHCG	0	4.00	hybrid
2329	3.979 (Crystgin)	OHCG3979	Once Human	747000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	OHCG	0	4.00	hybrid
2330	62 (Crystgin)	OHCG62	Once Human	15000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	OHCG	0	4.00	hybrid
2331	8.075 (Crystgin)	OHCG8075	Once Human	1500000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	OHCG	0	4.00	hybrid
2332	Battle Pass Advanced	OHPPBA	Once Human	150000	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:33.292695	OHPP	0	4.00	hybrid
2760	Voucher PSN IDR 225.000	PSIDR225	Play Station PSN	214075	\N	\N	f	f	2025-11-10 09:44:39.980819	2025-11-10 09:44:39.980819	PSIDR	0	4.00	hybrid
2352	Chief Inauguration Special V	PNPPCIS5	Path to Nowhere	703800	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNPP	0	4.00	hybrid
2353	Chief Inauguration Special VI 	PNPPCIS6	Path to Nowhere	1325300	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNPP	0	4.00	hybrid
2354	Dis Jackpot	PNPPDIS	Path to Nowhere	228500	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNPP	0	4.00	hybrid
2355	Monthly Arrest Pack I	PNPPMAP1	Path to Nowhere	228600	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNPP	0	4.00	hybrid
2356	Monthly Arrest Pack II	PNPPMAP2	Path to Nowhere	365700	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNPP	0	4.00	hybrid
2357	Rookie Arrest Pack	PNPPRAP	Path to Nowhere	283400	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNPP	0	4.00	hybrid
2358	Weekly Arrest Pack	PNPPWE1	Path to Nowhere	15700	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNPP	0	4.00	hybrid
2359	Weekly Training Pack I	PNPPWE2	Path to Nowhere	73200	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNPP	0	4.00	hybrid
2360	Weekly Training Pack II	PNPPWE3	Path to Nowhere	228500	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNPP	0	4.00	hybrid
2361	1980+400 Ultracubes	PNUC1980	Path to Nowhere	429600	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNUC	0	4.00	hybrid
2362	300+30 Ultracubes	PNUC300	Path to Nowhere	73200	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNUC	0	4.00	hybrid
2363	3280+700 Ultracubes	PNUC3280	Path to Nowhere	703800	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNUC	0	4.00	hybrid
2364	60 Ultracubes	PNUC60	Path to Nowhere	15700	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNUC	0	4.00	hybrid
2365	6480+1600 Ultracubes	PNUC6480	Path to Nowhere	1325300	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNUC	0	4.00	hybrid
2366	980+150 Ultracubes	PNUC980	Path to Nowhere	228500	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PNUC	0	4.00	hybrid
2367	1220 + 130 Bonus AeosGems 	PUAG1350	Pokémon Unite	258278	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PUAG	0	4.00	hybrid
2368	245 + 5 Bonus AeosGems	PUAG250	Pokémon Unite	51830	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PUAG	0	4.00	hybrid
2369	2450 + 290 Bonus AeosGems	PUAG2740	Pokémon Unite	508518	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PUAG	0	4.00	hybrid
2370	3050 + 450 Bonus AeosGems	PUAG3500	Pokémon Unite	625818	\N	\N	t	f	2025-10-29 19:59:00.033195	2025-11-10 09:44:39.980819	PUAG	0	4.00	hybrid
2371	490 + 35 Bonus AeosGems	PUAG525	Pokémon Unite	101878	\N	\N	t	f	2025-10-29 19:59:06.275212	2025-11-10 09:44:39.980819	PUAG	0	4.00	hybrid
2372	60 AeosGems	PUAG60	Pokémon Unite	13512	\N	\N	t	f	2025-10-29 19:59:06.275212	2025-11-10 09:44:39.980819	PUAG	0	4.00	hybrid
2373	6000 + 1100 Bonus AeosGems	PUAG7100	Pokémon Unite	1251418	\N	\N	t	f	2025-10-29 19:59:06.275212	2025-11-10 09:44:39.980819	PUAG	0	4.00	hybrid
2703	Voucher 1200 PB Cash	PVVC1200	Point Blank	9891	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:39.980819	PVVC	0	4.00	hybrid
2704	Voucher 12000 PB Cash	PVVC12000	Point Blank	89906	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:39.980819	PVVC	0	4.00	hybrid
2705	Voucher 2400 PB Cash	PVVC2400	Point Blank	18781	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:39.980819	PVVC	0	4.00	hybrid
2706	Voucher 24000 PB Cash	PVVC24000	Point Blank	178813	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:39.980819	PVVC	0	4.00	hybrid
2707	Voucher 36000 PB Cash	PVVC36000	Point Blank	267719	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:39.980819	PVVC	0	4.00	hybrid
2708	Voucher 6000 PB Cash	PVVC6000	Point Blank	45453	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:39.980819	PVVC	0	4.00	hybrid
2709	Voucher 60000 PB Cash	PVVC60000	Point Blank	445532	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:39.980819	PVVC	0	4.00	hybrid
2710	Roblox Gift Card IDR 100K	RBIDR100	Roblox	98200	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:39.980819	RBIDR	0	4.00	hybrid
2711	Roblox Gift Card IDR 300K	RBIDR300	Roblox	295200	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:39.980819	RBIDR	0	4.00	hybrid
2712	Roblox Gift Card IDR 50K	RBIDR50	Roblox	51250	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:39.980819	RBIDR	0	4.00	hybrid
2713	Roblox Gift Card IDR 500K	RBIDR500	Roblox	480250	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:39.980819	RBIDR	0	4.00	hybrid
2714	Roblox Gift Card IDR 65K	RBIDR65	Roblox	66250	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:39.980819	RBIDR	0	4.00	hybrid
2716	200 Robux	RBRB200	Roblox	104000	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:39.980819	RBRBX	0	4.00	hybrid
2717	800 Robux	RBRB800	Roblox	163200	\N	\N	t	f	2025-11-01 21:51:47.55568	2025-11-10 09:44:39.980819	RBRBX	0	4.00	hybrid
\.


--
-- Data for Name: providers; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.providers (id, name, code, api_endpoint, credentials, balance, is_active, created_at, updated_at, member_id, pin, username, key) FROM stdin;
2	otomax	otomax	http://103.184.122.173:6969/	{"api_key":"222","secret_key":"222222222222","username":"2222222","password":"2222222222222"}	100000	t	2025-09-18 03:29:27.474691	2025-09-18 03:29:27.474691	WEB0001	8043	Web Development	8g2BPT1V9juv
\.


--
-- Data for Name: register_reseller_transaction; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.register_reseller_transaction (id, reseller_packet_id, reference_id, duration, price, discount, email, phone_number, method_code, method_name, payment_payload, status, paid_at, created_at, updated_at, fee, total, template_website, payment_url, domain_id, price_addon, domain) FROM stdin;
31	20	INVRSL1760939773	3	872000	0	wafiq610@gmail.com	82226197047	SQ	QRIS ( All Payment )	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE5204581653033605409883000.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJLWJPK6S02120819190858480309ZILOGGAME0520NQ6121_0_91DE16AD5540703A0163047309","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ251BKZDWB1M1SMPJL","amount":"883000","reference":"D2033625GVW2RZZYKHV5D4T","statusCode":"00","statusMessage":"SUCCESS"}	pending	\N	2025-10-20 05:56:13.942347	2025-10-20 12:56:15.932875	11947.0000	894947	1	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE5204581653033605409883000.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJLWJPK6S02120819190858480309ZILOGGAME0520NQ6121_0_91DE16AD5540703A0163047309	16	11000	vazzuniverse.my.id.my.id
32	20	INVRSL1762745676	3	872000	0	wafiq610@gmail.com	82216197047	SQ	QRIS ( All Payment )	{"merchantOrderId":"","Amount":0,"refId":"","merchantOrderIds":"INVRSL1762745676","resultCode":"00","signature":""}	paid	\N	2025-11-10 03:34:36.386282	2025-11-10 03:39:52.362823	14520.0000	1046520	1	\N	17	160000	vazzuniverse.com.com
30	20	INVRSL1760939357	3	872000	0	wafiq610@gmail.com	82226197047	SQ	QRIS ( All Payment )	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE5204581653033605409883000.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJNXU1QAW02120819190858480309ZILOGGAME0520NQ6121_0_1E4725BE58B0703A016304D19D","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25EXOOJXU36PLJA2T","amount":"883000","reference":"D2033625OPGS1USHD2PYJWQ","statusCode":"00","statusMessage":"SUCCESS"}	pending	\N	2025-10-20 05:49:17.702823	2025-10-20 12:49:19.636491	11947.0000	894947	1	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE5204581653033605409883000.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJNXU1QAW02120819190858480309ZILOGGAME0520NQ6121_0_1E4725BE58B0703A016304D19D	16	11000	vazzuniverse.my.id.my.id
\.


--
-- Data for Name: reseller_packet; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.reseller_packet (id, name, description, price, type_package, benefit, created_at, kode_payment, discount) FROM stdin;
11	Supreme	Fitur terlengkap, untung terbesar!	1247000	3BULAN	["Potensi Profit Hingga Rp20jt/bln","Akses Semua Produk","Harga Modal Paling Murah","Tanpa Deposit","GRATIS Domain (12 Pilihan)","Website Super Fast","Kustomisasi Website","Optimasi SEO & Pixel","Manajemen Kupon Diskon","Variasi Template Website","Gratis Domain .com dll","Fitur Flash Sale","Penarikan Saldo Instan","Kustomisasi Detail Produk","Build Your APK","Prioritized Support (WhatsApp)"]	2025-10-08 12:57:46.482194	PAKETSUP3	0
20	Legend	Naik level, untung berlipat!	872000	3BULAN	["Potensi Profit Hingga Rp10jt/bln","Akses Semua Produk","Harga Modal Lebih Murah","Tanpa Deposit","GRATIS Domain (2 Pilihan)","Website Faster","Kustomisasi Website","Optimasi SEO & Pixel","Manajemen Kupon Diskon","Variasi Template Website","X  Hanya .my.id & .biz.id","X Fitur Flash Sale","X  Penarikan Saldo Instan","X  Kustomisasi Detail Produk","X  Build Your APK","X Prioritized Support (WhatsApp)"]	2025-10-08 13:23:01.345821	PAKETLEG3	0
25	Legend	Naik level, untung berlipat!	1650000	6BULAN	["Potensi Profit Hingga Rp10jt/bln","Akses Semua Produk","Harga Modal Lebih Murah","Tanpa Deposit","GRATIS Domain (2 Pilihan)","Website Faster","Kustomisasi Website","Optimasi SEO & Pixel","Manajemen Kupon Diskon","Variasi Template Website","X  Hanya .my.id & .biz.id","X Fitur Flash Sale","X  Penarikan Saldo Instan","X  Kustomisasi Detail Produk","X  Build Your APK","X Prioritized Support (WhatsApp)"]	2025-10-08 06:43:01.540465	PAKETLEG6	0
28	Pro	Mulai bisnis dengan mudah!	1600000	12BULAN	["Potensi Profit Hingga Rp5jt/bln","Akses Semua Produk","Harga Modal Murah","Tanpa Deposit","GRATIS Domain (2 Pilihan)","Website Fast","Kustomisasi Website","Optimasi SEO & Pixel","Manajemen Kupon Diskon","X Variasi Template Website","X Hanya .my.id & .biz.id","X Fitur Flash Sale","X Penarikan Saldo Instan","X  Kustomisasi Detail Produk","X  Build Your APK","X  Prioritized Support (WhatsApp)"]	2025-10-08 06:53:20.05394	PAKETPRO12	0
21	Pro	Mulai bisnis dengan mudah!	497000	3BULAN	["Potensi Profit Hingga Rp5jt/bln","Akses Semua Produk","Harga Modal Murah","Tanpa Deposit","GRATIS Domain (2 Pilihan)","Website Fast","Kustomisasi Website","Optimasi SEO & Pixel","Manajemen Kupon Diskon","X Variasi Template Website","X Hanya .my.id & .biz.id","X Fitur Flash Sale","X Penarikan Saldo Instan","X  Kustomisasi Detail Produk","X  Build Your APK","X  Prioritized Support (WhatsApp)"]	2025-10-08 13:25:30.077653	PAKETPRO3	0
23	Basic	Mulai Jualan Sekarang!	500000	6BULAN	["Potensi Profit Hingga Rp5jt/bln","Akses Semua Produk","Harga Modal Murah","Tanpa Deposit","GRATIS Domain (2 Pilihan)","Website Fast","Kustomisasi Website","Optimasi SEO & Pixel","Manajemen Kupon Diskon","X Variasi Template Website","X Hanya .my.id & .biz.id","X Fitur Flash Sale","X Penarikan Saldo Instan","X  Kustomisasi Detail Produk","X  Build Your APK","X  Prioritized Support (WhatsApp)"]	2025-10-08 06:32:13.90437	PAKETBAS6	0
29	Legend	Naik level, untung berlipat!	3150000	12BULAN	["Potensi Profit Hingga Rp5jt/bln","Akses Semua Produk","Harga Modal Murah","Tanpa Deposit","GRATIS Domain (2 Pilihan)","Website Fast","Kustomisasi Website","Optimasi SEO & Pixel","Manajemen Kupon Diskon","X Variasi Template Website","X Hanya .my.id & .biz.id","X Fitur Flash Sale","X Penarikan Saldo Instan","X  Kustomisasi Detail Produk","X  Build Your APK","X  Prioritized Support (WhatsApp)"]	2025-10-08 06:55:26.781099	PAKETLEG12	0
27	Basic	Mulai Jualan Sekarang!	850000	12BULAN	["Potensi Profit Hingga Rp5jt/bln","Akses Semua Produk","Harga Modal Murah","Tanpa Deposit","GRATIS Domain (2 Pilihan)","Website Fast","Kustomisasi Website","Optimasi SEO & Pixel","Manajemen Kupon Diskon","X Variasi Template Website","X Hanya .my.id & .biz.id","X Fitur Flash Sale","X Penarikan Saldo Instan","X  Kustomisasi Detail Produk","X  Build Your APK","X  Prioritized Support (WhatsApp)"]	2025-10-08 06:46:00.420805	PAKETBAS12	0
24	Pro	Mulai bisnis dengan mudah!	850000	6BULAN	["Potensi Profit Hingga Rp5jt/bln","Akses Semua Produk","Harga Modal Murah","Tanpa Deposit","GRATIS Domain (2 Pilihan)","Website Fast","Kustomisasi Website","Optimasi SEO & Pixel","Manajemen Kupon Diskon","X Variasi Template Website","X Hanya .my.id & .biz.id","X Fitur Flash Sale","X Penarikan Saldo Instan","X  Kustomisasi Detail Produk","X  Build Your APK","X  Prioritized Support (WhatsApp)"]	2025-10-08 06:41:30.824784	PAKETPRO6	0
26	Supreme	Fitur terlengkap, untung terbesar!	2500000	6BULAN	["Potensi Profit Hingga Rp20jt/bln","Akses Semua Produk","Harga Modal Paling Murah","Tanpa Deposit","GRATIS Domain (12 Pilihan)","Website Super Fast","Kustomisasi Website","Optimasi SEO & Pixel","Manajemen Kupon Diskon","Variasi Template Website","Gratis Domain .com dll","Fitur Flash Sale","Penarikan Saldo Instan","Kustomisasi Detail Produk","Build Your APK","Prioritized Support (WhatsApp)"]	2025-10-08 06:44:22.722276	PAKETSUP6	0
30	Supreme	Fitur terlengkap, untung terbesar!	4750000	12BULAN	["Potensi Profit Hingga Rp20jt/bln","Akses Semua Produk","Harga Modal Paling Murah","Tanpa Deposit","GRATIS Domain (12 Pilihan)","Website Super Fast","Kustomisasi Website","Optimasi SEO & Pixel","Manajemen Kupon Diskon","Variasi Template Website","Gratis Domain .com dll","Fitur Flash Sale","Penarikan Saldo Instan","Kustomisasi Detail Produk","Build Your APK","Prioritized Support (WhatsApp)"]	2025-10-08 06:56:25.553016	PAKETSUP12	0
22	Basic	Mulai Jualan Sekarang!	300000	3BULAN	["Potensi Profit Hingga Rp5jt/bln","Akses Semua Produk","Harga Modal Murah","Tanpa Deposit","GRATIS Domain (2 Pilihan)","Website Fast","Kustomisasi Website","Optimasi SEO & Pixel","Manajemen Kupon Diskon","X Variasi Template Website","X Hanya .my.id & .biz.id","X Fitur Flash Sale","X Penarikan Saldo Instan","X  Kustomisasi Detail Produk","X  Build Your APK","X  Prioritized Support (WhatsApp)"]	2025-10-08 13:29:31.668834	PAKETBAS3	6983
\.


--
-- Data for Name: reseller_packet_features; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.reseller_packet_features (id, packet_code, code, name, is_enabled, link, display_order, created_at) FROM stdin;
1	PAKETLEG3	flash_sale	Flash Sale	t	/dashboard/flash-sale	0	2025-10-26 02:24:29.741539
2	PAKETLEG3	custom_product	Custom Products	t	\N	1	2025-10-26 02:26:39.381687
5	PAKETBAS3	custom_banner	Custom Banner	f	\N	0	2025-10-28 18:55:33.552838
4	PAKETBAS3	flash_sale	Flash Sale	t	/dashboard/events	1	2025-10-28 06:57:12.393732
\.


--
-- Data for Name: reseller_pricing; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.reseller_pricing (id, branch_id, margin_default_amount, margin_default_percentage, calculation_type_admin, margin_value_amount, margin_value_percentage, calculation_type_reseller, product_code, is_active, is_main_active, created_at, updated_at, is_flash_sale, price_flash_sale, start_at, end_at) FROM stdin;
311	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR1050	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
1344	2	3200	12.00	hybrid	0	0.00	hybrid	AEAC499	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1345	2	3200	12.00	hybrid	0	0.00	hybrid	AEAC4999	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1346	2	3200	12.00	hybrid	0	0.00	hybrid	AEAC99	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1347	2	3200	12.00	hybrid	0	0.00	hybrid	AEAC999	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1348	2	3200	12.00	hybrid	0	0.00	hybrid	AEAC9999	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1349	2	3200	12.00	hybrid	0	0.00	hybrid	AEEC2100	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1350	2	3200	12.00	hybrid	0	0.00	hybrid	AEEC24K	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1351	2	3200	12.00	hybrid	0	0.00	hybrid	AEEC400	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1352	2	3200	12.00	hybrid	0	0.00	hybrid	AEEC4400	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1353	2	3200	12.00	hybrid	0	0.00	hybrid	AEEC50	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1354	2	3200	12.00	hybrid	0	0.00	hybrid	AEEC9200	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1355	2	3200	12.00	hybrid	0	0.00	hybrid	AFDC126	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1356	2	3200	12.00	hybrid	0	0.00	hybrid	AFDC1554	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1357	2	3200	12.00	hybrid	0	0.00	hybrid	AFDC21	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	t	1000	2025-11-14 07:44:00+00	2025-11-15 07:44:00+00
1358	2	3200	12.00	hybrid	0	0.00	hybrid	AFDC294	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1359	2	3200	12.00	hybrid	0	0.00	hybrid	AFDC3150	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
347	2	3200	0.90	hybrid	0	0.00	hybrid	MLID257	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.566879	f	\N	\N	\N
398	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY1000	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
399	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY1071	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
400	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY112	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
401	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY1145	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
402	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY14	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
403	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY140	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
404	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY1446	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
405	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY154	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
406	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY182	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
407	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY210	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
408	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY2162	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
409	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY266	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
410	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY28	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
411	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY284	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
412	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY2976	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
413	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY298	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
414	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY326	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
415	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY355	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
416	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY397	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
417	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY42	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
418	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY429	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
419	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY495	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
420	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY537	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
421	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY56	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
422	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY569	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
423	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY611	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
424	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY639	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
425	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY70	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
426	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY716	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
427	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY784	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
428	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY84	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
429	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY858	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
430	2	3200	0.90	hybrid	0	0.00	hybrid	MLMY928	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
431	2	3200	0.90	hybrid	0	0.00	hybrid	MLMYTP	t	t	2025-10-23 16:18:15.678218	2025-10-23 16:18:15.678218	f	\N	\N	\N
1385	2	3200	12.00	hybrid	0	0.00	hybrid	BSPSLC	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1386	2	3200	12.00	hybrid	0	0.00	hybrid	BSPSLU	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1387	2	3200	12.00	hybrid	0	0.00	hybrid	CAOP1980	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1388	2	3200	12.00	hybrid	0	0.00	hybrid	CAOP300	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1389	2	3200	12.00	hybrid	0	0.00	hybrid	CAOP3280	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1390	2	3200	12.00	hybrid	0	0.00	hybrid	CAOP60	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1391	2	3200	12.00	hybrid	0	0.00	hybrid	CAOP6480	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1392	2	3200	12.00	hybrid	0	0.00	hybrid	CAOP980	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1393	2	3200	12.00	hybrid	0	0.00	hybrid	CAPP15	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1394	2	3200	12.00	hybrid	0	0.00	hybrid	CAPP30	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1395	2	3200	12.00	hybrid	0	0.00	hybrid	CAVO1980	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1396	2	3200	12.00	hybrid	0	0.00	hybrid	CAVO300	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
584	2	3200	0.90	hybrid	0	0.00	hybrid	FFMBID	t	t	2025-10-23 16:18:15.842288	2025-10-23 16:18:15.842288	f	\N	\N	\N
585	2	3200	0.90	hybrid	0	0.00	hybrid	FFMBMY	t	t	2025-10-23 16:18:15.842288	2025-10-23 16:18:15.842288	f	\N	\N	\N
586	2	3200	0.90	hybrid	0	0.00	hybrid	FFMBPID	t	t	2025-10-23 16:18:15.842288	2025-10-23 16:18:15.842288	f	\N	\N	\N
587	2	3200	0.90	hybrid	0	0.00	hybrid	FFMBSG	t	t	2025-10-23 16:18:15.842288	2025-10-23 16:18:15.842288	f	\N	\N	\N
588	2	3200	0.90	hybrid	0	0.00	hybrid	FFMMID	t	t	2025-10-23 16:18:15.842288	2025-10-23 16:18:15.842288	f	\N	\N	\N
589	2	3200	0.90	hybrid	0	0.00	hybrid	FFMMSG	t	t	2025-10-23 16:18:15.842288	2025-10-23 16:18:15.842288	f	\N	\N	\N
590	2	3200	0.90	hybrid	0	0.00	hybrid	FFMMY	t	t	2025-10-23 16:18:15.842288	2025-10-23 16:18:15.842288	f	\N	\N	\N
567	2	3200	0.90	hybrid	0	0.00	hybrid	FFID820	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
568	2	3200	0.90	hybrid	0	0.00	hybrid	FFID840	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
569	2	3200	0.90	hybrid	0	0.00	hybrid	FFID860	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
570	2	3200	0.90	hybrid	0	0.00	hybrid	FFID8730	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
571	2	3200	0.90	hybrid	0	0.00	hybrid	FFID90	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
572	2	3200	0.90	hybrid	0	0.00	hybrid	FFID910	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
593	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY1080	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
594	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY11500	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
595	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY210	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
596	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY2180	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
597	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY2200	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
598	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY25	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
599	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY310	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
600	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY400	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
601	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY4450	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
602	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY50	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
603	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY520	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
604	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY530	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
605	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY5600	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
606	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY645	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
607	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY6900	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
608	2	3200	0.90	hybrid	0	0.00	hybrid	FFSG100	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
609	2	3200	0.90	hybrid	0	0.00	hybrid	FFSG1060	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
610	2	3200	0.90	hybrid	0	0.00	hybrid	FFSG1080	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
611	2	3200	0.90	hybrid	0	0.00	hybrid	FFSG11500	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
612	2	3200	0.90	hybrid	0	0.00	hybrid	FFSG210	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
613	2	3200	0.90	hybrid	0	0.00	hybrid	FFSG2180	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
614	2	3200	0.90	hybrid	0	0.00	hybrid	FFSG2200	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
616	2	3200	0.90	hybrid	0	0.00	hybrid	FFSG310	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
617	2	3200	0.90	hybrid	0	0.00	hybrid	FFSG400	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
618	2	3200	0.90	hybrid	0	0.00	hybrid	FFSG520	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
619	2	3200	0.90	hybrid	0	0.00	hybrid	FFSG530	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
1651	2	3200	12.00	hybrid	0	1.00	hybrid	FMSVR99	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	0001-01-01 00:00:00+00	0001-01-01 00:00:00+00
1652	2	3200	12.00	hybrid	0	1.00	hybrid	FMSVR999	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	0001-01-01 00:00:00+00	0001-01-01 00:00:00+00
1653	2	3200	12.00	hybrid	0	1.00	hybrid	FMSVR9999	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	0001-01-01 00:00:00+00	0001-01-01 00:00:00+00
1654	2	3200	12.00	hybrid	0	0.00	hybrid	GIBSWM1	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1655	2	3200	12.00	hybrid	0	0.00	hybrid	GIBSWM2	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1656	2	3200	12.00	hybrid	0	0.00	hybrid	GIBSWM3	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1657	2	3200	12.00	hybrid	0	0.00	hybrid	GIBSWM4	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1658	2	3200	12.00	hybrid	0	0.00	hybrid	GIBSWM5	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1659	2	3200	12.00	hybrid	0	0.00	hybrid	GICN1980	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1660	2	3200	12.00	hybrid	0	0.00	hybrid	GICN300	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1661	2	3200	12.00	hybrid	0	0.00	hybrid	GICN3280	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1662	2	3200	12.00	hybrid	0	0.00	hybrid	GICN60	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1663	2	3200	12.00	hybrid	0	0.00	hybrid	GICN6480	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1664	2	3200	12.00	hybrid	0	0.00	hybrid	GICN980	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1665	2	3200	12.00	hybrid	0	0.00	hybrid	GICR1980	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1666	2	3200	12.00	hybrid	0	0.00	hybrid	GICR300	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1667	2	3200	12.00	hybrid	0	0.00	hybrid	GICR3280	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1668	2	3200	12.00	hybrid	0	0.00	hybrid	GICR60	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1669	2	3200	12.00	hybrid	0	0.00	hybrid	GICR6480	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1670	2	3200	12.00	hybrid	0	0.00	hybrid	GICR980	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1681	2	3200	12.00	hybrid	0	0.00	hybrid	GVGM120	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1682	2	3200	12.00	hybrid	0	0.00	hybrid	GVGM1500	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1683	2	3200	12.00	hybrid	0	0.00	hybrid	GVGM2300	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1684	2	3200	12.00	hybrid	0	0.00	hybrid	GVGM2370	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1685	2	3200	12.00	hybrid	0	0.00	hybrid	GVGM320	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1686	2	3200	12.00	hybrid	0	0.00	hybrid	GVGM4200	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1687	2	3200	12.00	hybrid	0	0.00	hybrid	GVGM60	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1688	2	3200	12.00	hybrid	0	0.00	hybrid	GVGM6200	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1689	2	3200	12.00	hybrid	0	0.00	hybrid	GVGM720	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1690	2	3200	12.00	hybrid	0	0.00	hybrid	GVGMMP	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1691	2	3200	12.00	hybrid	0	0.00	hybrid	GWMS1Y	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1692	2	3200	12.00	hybrid	0	0.00	hybrid	GWMSCOG	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1693	2	3200	12.00	hybrid	0	0.00	hybrid	GWMSGA	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1694	2	3200	12.00	hybrid	0	0.00	hybrid	GWMSGB	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1919	2	3200	12.00	hybrid	0	0.00	hybrid	MC5	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1695	2	3200	12.00	hybrid	0	0.00	hybrid	GWMSGF	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1696	2	3200	12.00	hybrid	0	0.00	hybrid	GWMSIRG	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1697	2	3200	12.00	hybrid	0	0.00	hybrid	GWMSRGP	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1698	2	3200	12.00	hybrid	0	0.00	hybrid	HBPQ10K	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1699	2	3200	12.00	hybrid	0	0.00	hybrid	HBPQ130	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1700	2	3200	12.00	hybrid	0	0.00	hybrid	HBPQ1370	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1701	2	3200	12.00	hybrid	0	0.00	hybrid	HBPQ2720	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1702	2	3200	12.00	hybrid	0	0.00	hybrid	HBPQ410	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1703	2	3200	12.00	hybrid	0	0.00	hybrid	HBPQ4750	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1704	2	3200	12.00	hybrid	0	0.00	hybrid	HBPQ870	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1705	2	3200	12.00	hybrid	0	0.00	hybrid	HFPCFCSO	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1706	2	3200	12.00	hybrid	0	0.00	hybrid	HFPCFGSO	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1707	2	3200	12.00	hybrid	0	0.00	hybrid	HFPCFMSO	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1708	2	3200	12.00	hybrid	0	0.00	hybrid	HFPCLU	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1709	2	3200	12.00	hybrid	0	0.00	hybrid	HFPCSB1	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1710	2	3200	12.00	hybrid	0	0.00	hybrid	HFPCSB2	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1711	2	3200	12.00	hybrid	0	0.00	hybrid	HFPCSOP	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1712	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCM1	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1713	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCM2	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1714	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCM3	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1715	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCM4	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1716	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCRT1	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1725	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCU4	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1726	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCUT1	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1727	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCUT2	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1728	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCUT3	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1729	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCUT4	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1730	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCUT5	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1731	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCUT6	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1732	2	3200	12.00	hybrid	0	0.00	hybrid	HFSG1980	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1733	2	3200	12.00	hybrid	0	0.00	hybrid	HFSG300	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1734	2	3200	12.00	hybrid	0	0.00	hybrid	HFSG3280	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1740	2	3200	12.00	hybrid	0	0.00	hybrid	HGDS3362	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1741	2	3200	12.00	hybrid	0	0.00	hybrid	HGDS381	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1742	2	3200	12.00	hybrid	0	0.00	hybrid	HGDS46	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
517	2	3200	0.90	hybrid	0	0.00	hybrid	FFID425	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
518	2	3200	0.90	hybrid	0	0.00	hybrid	FFID4340	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
519	2	3200	0.90	hybrid	0	0.00	hybrid	FFID4450	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
551	2	3200	0.90	hybrid	0	0.00	hybrid	FFID725	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
552	2	3200	0.90	hybrid	0	0.00	hybrid	FFID7290	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
554	2	3200	0.90	hybrid	0	0.00	hybrid	FFID7310	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
555	2	3200	0.90	hybrid	0	0.00	hybrid	FFID7340	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
556	2	3200	0.90	hybrid	0	0.00	hybrid	FFID7360	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
557	2	3200	0.90	hybrid	0	0.00	hybrid	FFID740	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
558	2	3200	0.90	hybrid	0	0.00	hybrid	FFID7430	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
559	2	3200	0.90	hybrid	0	0.00	hybrid	FFID75	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
560	2	3200	0.90	hybrid	0	0.00	hybrid	FFID7645	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
561	2	3200	0.90	hybrid	0	0.00	hybrid	FFID7650	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
1735	2	3200	12.00	hybrid	0	0.00	hybrid	HFSG60	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1736	2	3200	12.00	hybrid	0	0.00	hybrid	HFSG6480	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1737	2	3200	12.00	hybrid	0	0.00	hybrid	HFSG980	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1738	2	3200	12.00	hybrid	0	0.00	hybrid	HGDS1680	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1739	2	3200	12.00	hybrid	0	0.00	hybrid	HGDS228	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1743	2	3200	12.00	hybrid	0	0.00	hybrid	HGDS6	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1744	2	3200	12.00	hybrid	0	0.00	hybrid	HGDS91	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1745	2	3200	12.00	hybrid	0	0.00	hybrid	HGDS915	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1746	2	3200	12.00	hybrid	0	0.00	hybrid	HIBC1320	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1747	2	3200	12.00	hybrid	0	0.00	hybrid	HIBC1980	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1819	2	3200	12.00	hybrid	0	0.00	hybrid	KCDM26	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1820	2	3200	12.00	hybrid	0	0.00	hybrid	KCDM268	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1821	2	3200	12.00	hybrid	0	0.00	hybrid	KCDM2750	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1822	2	3200	12.00	hybrid	0	0.00	hybrid	KCDM810	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1823	2	3200	12.00	hybrid	0	0.00	hybrid	KCPCDWC	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1824	2	3200	12.00	hybrid	0	0.00	hybrid	KCPCLB	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1825	2	3200	12.00	hybrid	0	0.00	hybrid	KCPCMC	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1826	2	3200	12.00	hybrid	0	0.00	hybrid	KCPCWC	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1827	2	3200	12.00	hybrid	0	0.00	hybrid	KCPCYC	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1828	2	3200	12.00	hybrid	0	0.00	hybrid	LA10	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1829	2	3200	12.00	hybrid	0	0.00	hybrid	LA100	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1830	2	3200	12.00	hybrid	0	0.00	hybrid	LA15	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1831	2	3200	12.00	hybrid	0	0.00	hybrid	LA150	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1832	2	3200	12.00	hybrid	0	0.00	hybrid	LA20	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1787	2	3200	12.00	hybrid	0	0.00	hybrid	HSOS4260	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
397	2	3200	0.90	hybrid	0	0.00	hybrid	MLMSMY1	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.230222	t	20000	2025-10-30 07:10:00+00	2025-10-31 07:10:00+00
2040	2	3200	12.00	hybrid	0	0.00	hybrid	SD10	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2041	2	3200	12.00	hybrid	0	0.00	hybrid	SD120	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2042	2	3200	12.00	hybrid	0	0.00	hybrid	SD123	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2043	2	3200	12.00	hybrid	0	0.00	hybrid	SD127	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2044	2	3200	12.00	hybrid	0	0.00	hybrid	SD2	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2045	2	3200	12.00	hybrid	0	0.00	hybrid	SD30	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2046	2	3200	12.00	hybrid	0	0.00	hybrid	SD4	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2047	2	3200	12.00	hybrid	0	0.00	hybrid	SD6	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2048	2	3200	12.00	hybrid	0	0.00	hybrid	SD60	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2049	2	3200	12.00	hybrid	0	0.00	hybrid	SD90	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2051	2	3200	12.00	hybrid	0	0.00	hybrid	SM10	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2094	2	3200	12.00	hybrid	0	0.00	hybrid	L2PCCB1	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2095	2	3200	12.00	hybrid	0	0.00	hybrid	L2PCCB2	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2096	2	3200	12.00	hybrid	0	0.00	hybrid	L2PCCB3	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2097	2	3200	12.00	hybrid	0	0.00	hybrid	L2PCDP1	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2098	2	3200	12.00	hybrid	0	0.00	hybrid	L2PCDP2	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2099	2	3200	12.00	hybrid	0	0.00	hybrid	L2PCDP3	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2100	2	3200	12.00	hybrid	0	0.00	hybrid	LDCR1980	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2253	2	3200	12.00	hybrid	0	0.00	hybrid	OPKP23	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2254	2	3200	12.00	hybrid	0	0.00	hybrid	OPKP321	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2255	2	3200	12.00	hybrid	0	0.00	hybrid	OPKP5	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2256	2	3200	12.00	hybrid	0	0.00	hybrid	OPKP54	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2257	2	3200	12.00	hybrid	0	0.00	hybrid	OPKP6	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2258	2	3200	12.00	hybrid	0	0.00	hybrid	OPKP61	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2259	2	3200	12.00	hybrid	0	0.00	hybrid	OPKP91	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2260	2	3200	12.00	hybrid	0	0.00	hybrid	PNPPBKV30	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2261	2	3200	12.00	hybrid	0	0.00	hybrid	PNPPCIS1	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2262	2	3200	12.00	hybrid	0	0.00	hybrid	PNPPCIS2	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2263	2	3200	12.00	hybrid	0	0.00	hybrid	PNPPCIS3	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2264	2	3200	12.00	hybrid	0	0.00	hybrid	PNPPCIS4	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2265	2	3200	12.00	hybrid	0	0.00	hybrid	PNPPCIS5	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2266	2	3200	12.00	hybrid	0	0.00	hybrid	PNPPCIS6	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2267	2	3200	12.00	hybrid	0	0.00	hybrid	PNPPDIS	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2268	2	3200	12.00	hybrid	0	0.00	hybrid	PNPPMAP1	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2269	2	3200	12.00	hybrid	0	0.00	hybrid	PNPPMAP2	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2270	2	3200	12.00	hybrid	0	0.00	hybrid	PNPPRAP	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2271	2	3200	12.00	hybrid	0	0.00	hybrid	PNPPWE1	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2272	2	3200	12.00	hybrid	0	0.00	hybrid	PNPPWE2	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2273	2	3200	12.00	hybrid	0	0.00	hybrid	PNPPWE3	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2274	2	3200	12.00	hybrid	0	0.00	hybrid	PNUC1980	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
5553	2	3200	12.00	hybrid	0	0.00	hybrid	RMGM6930	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5554	2	3200	12.00	hybrid	0	0.00	hybrid	RMGM735	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5555	2	3200	12.00	hybrid	0	0.00	hybrid	RMGM74	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5556	2	3200	12.00	hybrid	0	0.00	hybrid	RNDM10K2	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5557	2	3200	12.00	hybrid	0	0.00	hybrid	RNDM15K6	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5558	2	3200	12.00	hybrid	0	0.00	hybrid	RNDM160K	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5559	2	3200	12.00	hybrid	0	0.00	hybrid	RNDM2310	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5560	2	3200	12.00	hybrid	0	0.00	hybrid	RNDM31K2	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5561	2	3200	12.00	hybrid	0	0.00	hybrid	RNDM4990	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5562	2	3200	12.00	hybrid	0	0.00	hybrid	RNDM51K3	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5563	2	3200	12.00	hybrid	0	0.00	hybrid	RNPPAOE	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5564	2	3200	12.00	hybrid	0	0.00	hybrid	RNPPHPW	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5565	2	3200	12.00	hybrid	0	0.00	hybrid	RNPPOAB	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5566	2	3200	12.00	hybrid	0	0.00	hybrid	SCBG198	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5567	2	3200	12.00	hybrid	0	0.00	hybrid	SCBG30	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5568	2	3200	12.00	hybrid	0	0.00	hybrid	SCBG328	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5569	2	3200	12.00	hybrid	0	0.00	hybrid	SCBG6	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5570	2	3200	12.00	hybrid	0	0.00	hybrid	SCBG648	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5571	2	3200	12.00	hybrid	0	0.00	hybrid	SCBG98	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5572	2	3200	12.00	hybrid	0	0.00	hybrid	SDDD112	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5573	2	3200	12.00	hybrid	0	0.00	hybrid	SDDD1230	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
1372	2	3200	12.00	hybrid	0	0.00	hybrid	BS14	t	t	2025-10-30 17:39:37.896212	2025-11-03 16:47:39.50288	f	0	\N	\N
1373	2	3200	12.00	hybrid	0	0.00	hybrid	BS31	t	t	2025-10-30 17:39:37.896212	2025-11-03 16:47:39.50288	f	0	\N	\N
1374	2	3200	12.00	hybrid	0	0.00	hybrid	BS366	t	t	2025-10-30 17:39:37.896212	2025-11-03 16:47:39.50288	f	0	\N	\N
1375	2	3200	12.00	hybrid	0	0.00	hybrid	BS7	t	t	2025-10-30 17:39:37.896212	2025-11-03 16:47:39.50288	f	0	\N	\N
1376	2	3200	12.00	hybrid	0	0.00	hybrid	BS93	t	t	2025-10-30 17:39:37.896212	2025-11-03 16:47:39.50288	f	0	\N	\N
1343	2	3200	12.00	hybrid	0	0.00	hybrid	AEAC1999	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1401	2	3200	12.00	hybrid	0	0.00	hybrid	CC10	t	t	2025-10-30 17:39:37.896212	2025-11-03 16:47:39.50288	f	0	\N	\N
1402	2	3200	12.00	hybrid	0	0.00	hybrid	CC100	t	t	2025-10-30 17:39:37.896212	2025-11-03 16:47:39.50288	f	0	\N	\N
1403	2	3200	12.00	hybrid	0	0.00	hybrid	CC30	t	t	2025-10-30 17:39:37.896212	2025-11-03 16:47:39.50288	f	0	\N	\N
1404	2	3200	12.00	hybrid	0	0.00	hybrid	CC5	t	t	2025-10-30 17:39:37.896212	2025-11-03 16:47:39.50288	f	0	\N	\N
1405	2	3200	12.00	hybrid	0	0.00	hybrid	CC50	t	t	2025-10-30 17:39:37.896212	2025-11-03 16:47:39.50288	f	0	\N	\N
615	2	3200	0.90	hybrid	0	0.00	hybrid	FFSG25	t	t	2025-10-23 16:18:15.842288	2025-11-03 16:47:39.660202	f	\N	\N	\N
1671	2	3200	12.00	hybrid	0	0.00	hybrid	GP10	t	t	2025-10-30 17:39:38.197971	2025-11-03 16:47:39.660202	f	0	\N	\N
1672	2	3200	12.00	hybrid	0	0.00	hybrid	GP100	t	t	2025-10-30 17:39:38.197971	2025-11-03 16:47:39.660202	f	0	\N	\N
1673	2	3200	12.00	hybrid	0	0.00	hybrid	GP150	t	t	2025-10-30 17:39:38.197971	2025-11-03 16:47:39.660202	f	0	\N	\N
1674	2	3200	12.00	hybrid	0	0.00	hybrid	GP16	t	t	2025-10-30 17:39:38.197971	2025-11-03 16:47:39.660202	f	0	\N	\N
1675	2	3200	12.00	hybrid	0	0.00	hybrid	GP20	t	t	2025-10-30 17:39:38.197971	2025-11-03 16:47:39.660202	f	0	\N	\N
1676	2	3200	12.00	hybrid	0	0.00	hybrid	GP300	t	t	2025-10-30 17:39:38.197971	2025-11-03 16:47:39.660202	f	0	\N	\N
1677	2	3200	12.00	hybrid	0	0.00	hybrid	GP35	t	t	2025-10-30 17:39:38.197971	2025-11-03 16:47:39.660202	f	0	\N	\N
1678	2	3200	12.00	hybrid	0	0.00	hybrid	GP5	t	t	2025-10-30 17:39:38.197971	2025-11-03 16:47:39.660202	f	0	\N	\N
1679	2	3200	12.00	hybrid	0	0.00	hybrid	GP50	t	t	2025-10-30 17:39:38.197971	2025-11-03 16:47:39.660202	f	0	\N	\N
1680	2	3200	12.00	hybrid	0	0.00	hybrid	GP500	t	t	2025-10-30 17:39:38.197971	2025-11-03 16:47:39.660202	f	0	\N	\N
1878	2	3200	12.00	hybrid	0	0.00	hybrid	LLP13500	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1879	2	3200	12.00	hybrid	0	0.00	hybrid	LLP1380	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1880	2	3200	12.00	hybrid	0	0.00	hybrid	LLP2800	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1881	2	3200	12.00	hybrid	0	0.00	hybrid	LLP4500	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1882	2	3200	12.00	hybrid	0	0.00	hybrid	LLP575	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1883	2	3200	12.00	hybrid	0	0.00	hybrid	LLP6500	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1886	2	3200	12.00	hybrid	0	0.00	hybrid	LLPH13500	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1887	2	3200	12.00	hybrid	0	0.00	hybrid	LLPH1380	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1889	2	3200	12.00	hybrid	0	0.00	hybrid	LLPH2800	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1892	2	3200	12.00	hybrid	0	0.00	hybrid	LLPH4500	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1894	2	3200	12.00	hybrid	0	0.00	hybrid	LLPH575	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1895	2	3200	12.00	hybrid	0	0.00	hybrid	LLPH6500	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1904	2	3200	12.00	hybrid	0	0.00	hybrid	LRM1000	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1905	2	3200	12.00	hybrid	0	0.00	hybrid	LRM2050	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1906	2	3200	12.00	hybrid	0	0.00	hybrid	LRM3650	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1907	2	3200	12.00	hybrid	0	0.00	hybrid	LRM475	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1908	2	3200	12.00	hybrid	0	0.00	hybrid	LRM5350	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1909	2	3200	12.00	hybrid	0	0.00	hybrid	MC12	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1910	2	3200	12.00	hybrid	0	0.00	hybrid	MC170	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1911	2	3200	12.00	hybrid	0	0.00	hybrid	MC19	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1912	2	3200	12.00	hybrid	0	0.00	hybrid	MC2010	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1913	2	3200	12.00	hybrid	0	0.00	hybrid	MC240	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1914	2	3200	12.00	hybrid	0	0.00	hybrid	MC28	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1915	2	3200	12.00	hybrid	0	0.00	hybrid	MC296	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1916	2	3200	12.00	hybrid	0	0.00	hybrid	MC408	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1917	2	3200	12.00	hybrid	0	0.00	hybrid	MC44	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1918	2	3200	12.00	hybrid	0	0.00	hybrid	MC4830	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1920	2	3200	12.00	hybrid	0	0.00	hybrid	MC568	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1921	2	3200	12.00	hybrid	0	0.00	hybrid	MC59	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1922	2	3200	12.00	hybrid	0	0.00	hybrid	MC85	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
1923	2	3200	12.00	hybrid	0	0.00	hybrid	MC875	t	t	2025-10-30 17:39:38.371701	2025-11-03 16:47:39.788257	f	0	\N	\N
2010	2	3200	12.00	hybrid	0	0.00	hybrid	OA1280	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2011	2	3200	12.00	hybrid	0	0.00	hybrid	OA300	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2012	2	3200	12.00	hybrid	0	0.00	hybrid	OA3280	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2013	2	3200	12.00	hybrid	0	0.00	hybrid	OA60	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2014	2	3200	12.00	hybrid	0	0.00	hybrid	OA6480	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2015	2	3200	12.00	hybrid	0	0.00	hybrid	OA680	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2016	2	3200	12.00	hybrid	0	0.00	hybrid	PB1200	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2017	2	3200	12.00	hybrid	0	0.00	hybrid	PB12000	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2018	2	3200	12.00	hybrid	0	0.00	hybrid	PB2400	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2019	2	3200	12.00	hybrid	0	0.00	hybrid	PB36000	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2020	2	3200	12.00	hybrid	0	0.00	hybrid	PB6000	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2021	2	3200	12.00	hybrid	0	0.00	hybrid	PB60000	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2022	2	3200	12.00	hybrid	0	0.00	hybrid	RBL100	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2023	2	3200	12.00	hybrid	0	0.00	hybrid	RBL10K	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2024	2	3200	12.00	hybrid	0	0.00	hybrid	RBL200	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2025	2	3200	12.00	hybrid	0	0.00	hybrid	RBL2000	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2026	2	3200	12.00	hybrid	0	0.00	hybrid	RBL4500	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2027	2	3200	12.00	hybrid	0	0.00	hybrid	RBL800	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2028	2	3200	12.00	hybrid	0	0.00	hybrid	RBLID100	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2029	2	3200	12.00	hybrid	0	0.00	hybrid	RBLID300	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2030	2	3200	12.00	hybrid	0	0.00	hybrid	RBLID50	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2031	2	3200	12.00	hybrid	0	0.00	hybrid	RBLID500	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
385	2	3200	0.90	hybrid	0	0.00	hybrid	MLID89	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.230222	f	\N	\N	\N
2032	2	3200	12.00	hybrid	0	0.00	hybrid	RBLID65	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2033	2	3200	12.00	hybrid	0	0.00	hybrid	RBLUS10	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2034	2	3200	12.00	hybrid	0	0.00	hybrid	RBLUS15	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2035	2	3200	12.00	hybrid	0	0.00	hybrid	RBLUS20	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2036	2	3200	12.00	hybrid	0	0.00	hybrid	RBLUS25	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2037	2	3200	12.00	hybrid	0	0.00	hybrid	RBLUS30	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2038	2	3200	12.00	hybrid	0	0.00	hybrid	RBLUS40	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2039	2	3200	12.00	hybrid	0	0.00	hybrid	RBLUS50	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
2050	2	3200	12.00	hybrid	0	0.00	hybrid	SERUMAX	t	t	2025-10-30 17:39:38.528977	2025-11-03 16:47:39.91814	f	0	\N	\N
5661	2	3200	12.00	hybrid	0	0.00	hybrid	TTID13500	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5662	2	3200	12.00	hybrid	0	0.00	hybrid	TTID1380	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5663	2	3200	12.00	hybrid	0	0.00	hybrid	TTID2800	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5664	2	3200	12.00	hybrid	0	0.00	hybrid	TTID4500	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5856	2	3200	12.00	hybrid	0	0.00	hybrid	RGPHP250	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5857	2	3200	12.00	hybrid	0	0.00	hybrid	RGPHP300	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5858	2	3200	12.00	hybrid	0	0.00	hybrid	RGPHP50	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5859	2	3200	12.00	hybrid	0	0.00	hybrid	RGPHP500	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5860	2	3200	12.00	hybrid	0	0.00	hybrid	RGPHP5000	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5861	2	3200	12.00	hybrid	0	0.00	hybrid	SVIDR12	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5862	2	3200	12.00	hybrid	0	0.00	hybrid	SVIDR120	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5863	2	3200	12.00	hybrid	0	0.00	hybrid	SVIDR250	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5864	2	3200	12.00	hybrid	0	0.00	hybrid	SVIDR400	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5865	2	3200	12.00	hybrid	0	0.00	hybrid	SVIDR45	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5866	2	3200	12.00	hybrid	0	0.00	hybrid	SVIDR6	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
1360	2	3200	12.00	hybrid	0	0.00	hybrid	AFDC588	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1361	2	3200	12.00	hybrid	0	0.00	hybrid	AFEMCG	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1362	2	3200	12.00	hybrid	0	0.00	hybrid	AFEMPG	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1363	2	3200	12.00	hybrid	0	0.00	hybrid	AFGBGB	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1364	2	3200	12.00	hybrid	0	0.00	hybrid	AUDM144	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1365	2	3200	12.00	hybrid	0	0.00	hybrid	AUDM1536	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1366	2	3200	12.00	hybrid	0	0.00	hybrid	AUDM2376	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1367	2	3200	12.00	hybrid	0	0.00	hybrid	AUDM360	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1368	2	3200	12.00	hybrid	0	0.00	hybrid	AUDM3936	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1369	2	3200	12.00	hybrid	0	0.00	hybrid	AUDM72	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	t	12000	2025-11-05 06:38:00+00	2025-11-08 06:38:00+00
1370	2	3200	12.00	hybrid	0	0.00	hybrid	AUDM7776	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1371	2	3200	12.00	hybrid	0	0.00	hybrid	AUDM816	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1377	2	3200	12.00	hybrid	0	0.00	hybrid	BSGL100	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1378	2	3200	12.00	hybrid	0	0.00	hybrid	BSGL1000	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1379	2	3200	12.00	hybrid	0	0.00	hybrid	BSGL2000	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1380	2	3200	12.00	hybrid	0	0.00	hybrid	BSGL300	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1381	2	3200	12.00	hybrid	0	0.00	hybrid	BSGL500	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1382	2	3200	12.00	hybrid	0	0.00	hybrid	BSGL5000	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1383	2	3200	12.00	hybrid	0	0.00	hybrid	BSPS1	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1384	2	3200	12.00	hybrid	0	0.00	hybrid	BSPS2	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1397	2	3200	12.00	hybrid	0	0.00	hybrid	CAVO3280	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1398	2	3200	12.00	hybrid	0	0.00	hybrid	CAVO60	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1399	2	3200	12.00	hybrid	0	0.00	hybrid	CAVO6480	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1400	2	3200	12.00	hybrid	0	0.00	hybrid	CAVO980	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1406	2	3200	12.00	hybrid	0	0.00	hybrid	CDPPEP	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1407	2	3200	12.00	hybrid	0	0.00	hybrid	CDPPPM	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1408	2	3200	12.00	hybrid	0	0.00	hybrid	CDPPPP	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1409	2	3200	12.00	hybrid	0	0.00	hybrid	CDPPRG	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1410	2	3200	12.00	hybrid	0	0.00	hybrid	CDPPVIP	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1411	2	3200	12.00	hybrid	0	0.00	hybrid	CDTO1980	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1412	2	3200	12.00	hybrid	0	0.00	hybrid	CDTO300	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1413	2	3200	12.00	hybrid	0	0.00	hybrid	CDTO3280	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1414	2	3200	12.00	hybrid	0	0.00	hybrid	CDTO60	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1415	2	3200	12.00	hybrid	0	0.00	hybrid	CDTO6480	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1416	2	3200	12.00	hybrid	0	0.00	hybrid	CDTO980	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1417	2	3200	12.00	hybrid	0	0.00	hybrid	CIWP10K	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1418	2	3200	12.00	hybrid	0	0.00	hybrid	CIWP1K	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1419	2	3200	12.00	hybrid	0	0.00	hybrid	CIWP200	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1420	2	3200	12.00	hybrid	0	0.00	hybrid	CIWP5K	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1421	2	3200	12.00	hybrid	0	0.00	hybrid	CTGB1030	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1422	2	3200	12.00	hybrid	0	0.00	hybrid	CTGB1345	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1423	2	3200	12.00	hybrid	0	0.00	hybrid	CTGB2178	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1424	2	3200	12.00	hybrid	0	0.00	hybrid	CTGB315	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1425	2	3200	12.00	hybrid	0	0.00	hybrid	CTGB3608	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1426	2	3200	12.00	hybrid	0	0.00	hybrid	CTGB6	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1427	2	3200	12.00	hybrid	0	0.00	hybrid	CTGB63	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1428	2	3200	12.00	hybrid	0	0.00	hybrid	CTGB7128	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1429	2	3200	12.00	hybrid	0	0.00	hybrid	CTGB715	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1430	2	3200	12.00	hybrid	0	0.00	hybrid	DCCP120K	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1431	2	3200	12.00	hybrid	0	0.00	hybrid	DCCP12K	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1432	2	3200	12.00	hybrid	0	0.00	hybrid	DCCP18K	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1433	2	3200	12.00	hybrid	0	0.00	hybrid	DCCP30K	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1434	2	3200	12.00	hybrid	0	0.00	hybrid	DCCP3K	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1435	2	3200	12.00	hybrid	0	0.00	hybrid	DCCP600	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1436	2	3200	12.00	hybrid	0	0.00	hybrid	DCCP60K	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1437	2	3200	12.00	hybrid	0	0.00	hybrid	DCCP6K	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1438	2	3200	12.00	hybrid	0	0.00	hybrid	DHVO1499	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1439	2	3200	12.00	hybrid	0	0.00	hybrid	DHVO1799	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1440	2	3200	12.00	hybrid	0	0.00	hybrid	DHVO199	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1441	2	3200	12.00	hybrid	0	0.00	hybrid	DHVO299	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1442	2	3200	12.00	hybrid	0	0.00	hybrid	DHVO2999	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1443	2	3200	12.00	hybrid	0	0.00	hybrid	DHVO4699	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1444	2	3200	12.00	hybrid	0	0.00	hybrid	DHVO499	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1445	2	3200	12.00	hybrid	0	0.00	hybrid	DHVO7499	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1446	2	3200	12.00	hybrid	0	0.00	hybrid	DHVO99	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1447	2	3200	12.00	hybrid	0	0.00	hybrid	DHVO999	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1448	2	3200	12.00	hybrid	0	0.00	hybrid	DHVO9999	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1449	2	3200	12.00	hybrid	0	0.00	hybrid	EPCO10	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1450	2	3200	12.00	hybrid	0	0.00	hybrid	EPCO120	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1451	2	3200	12.00	hybrid	0	0.00	hybrid	EPCO1380	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1452	2	3200	12.00	hybrid	0	0.00	hybrid	EPCO2080	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1453	2	3200	12.00	hybrid	0	0.00	hybrid	EPCO300	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1454	2	3200	12.00	hybrid	0	0.00	hybrid	EPCO3450	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1455	2	3200	12.00	hybrid	0	0.00	hybrid	EPCO60	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1456	2	3200	12.00	hybrid	0	0.00	hybrid	EPCO6880	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
1457	2	3200	12.00	hybrid	0	0.00	hybrid	EPCO700	t	t	2025-10-30 17:39:37.896212	2025-11-17 03:43:51.87822	f	0	\N	\N
432	2	3200	0.90	hybrid	0	0.00	hybrid	FFGLOB100	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	0	0001-01-01 00:00:00+00	0001-01-01 00:00:00+00
433	2	3200	0.90	hybrid	0	0.00	hybrid	FFGLOB1080	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
434	2	3200	0.90	hybrid	0	0.00	hybrid	FFGLOB210	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
435	2	3200	0.90	hybrid	0	0.00	hybrid	FFGLOB2200	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
436	2	3200	0.90	hybrid	0	0.00	hybrid	FFGLOB4450	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
437	2	3200	0.90	hybrid	0	0.00	hybrid	FFGLOB530	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
438	2	3200	0.90	hybrid	0	0.00	hybrid	FFGLOB645	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
439	2	3200	0.90	hybrid	0	0.00	hybrid	FFGLOB6900	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
440	2	3200	0.90	hybrid	0	0.00	hybrid	FFID10	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
441	2	3200	0.90	hybrid	0	0.00	hybrid	FFID100	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
442	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1000	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
443	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1050	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
444	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1060	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
445	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1075	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
446	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1080	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
447	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1125	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
448	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1145	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
449	2	3200	0.90	hybrid	0	0.00	hybrid	FFID12	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
450	2	3200	0.90	hybrid	0	0.00	hybrid	FFID120	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
451	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1200	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
452	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1215	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
453	2	3200	0.90	hybrid	0	0.00	hybrid	FFID125	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
454	2	3200	0.90	hybrid	0	0.00	hybrid	FFID130	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
455	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1300	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
456	2	3200	0.90	hybrid	0	0.00	hybrid	FFID140	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
457	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1440	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
458	2	3200	0.90	hybrid	0	0.00	hybrid	FFID145	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
459	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1450	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
460	2	3200	0.90	hybrid	0	0.00	hybrid	FFID14580	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
461	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1490	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
462	2	3200	0.90	hybrid	0	0.00	hybrid	FFID15	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
463	2	3200	0.90	hybrid	0	0.00	hybrid	FFID150	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
464	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1510	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
465	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1580	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
466	2	3200	0.90	hybrid	0	0.00	hybrid	FFID160	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
467	2	3200	0.90	hybrid	0	0.00	hybrid	FFID170	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
468	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1795	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
469	2	3200	0.90	hybrid	0	0.00	hybrid	FFID180	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
470	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1800	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
471	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1875	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
472	2	3200	0.90	hybrid	0	0.00	hybrid	FFID190	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
473	2	3200	0.90	hybrid	0	0.00	hybrid	FFID1975	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
474	2	3200	0.90	hybrid	0	0.00	hybrid	FFID20	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
475	2	3200	0.90	hybrid	0	0.00	hybrid	FFID200	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
476	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2000	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
477	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2005	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
478	2	3200	0.90	hybrid	0	0.00	hybrid	FFID210	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
479	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2100	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
480	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2140	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
481	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2160	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
482	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2180	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
483	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2190	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
484	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2200	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
485	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2210	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
486	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2225	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
487	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2280	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
488	2	3200	0.90	hybrid	0	0.00	hybrid	FFID230	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
489	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2350	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
490	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2355	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
491	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2400	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
492	2	3200	0.90	hybrid	0	0.00	hybrid	FFID25	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
493	2	3200	0.90	hybrid	0	0.00	hybrid	FFID250	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
494	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2575	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
495	2	3200	0.90	hybrid	0	0.00	hybrid	FFID260	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
496	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2720	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
497	2	3200	0.90	hybrid	0	0.00	hybrid	FFID2750	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
498	2	3200	0.90	hybrid	0	0.00	hybrid	FFID280	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
499	2	3200	0.90	hybrid	0	0.00	hybrid	FFID30	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
500	2	3200	0.90	hybrid	0	0.00	hybrid	FFID300	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
501	2	3200	0.90	hybrid	0	0.00	hybrid	FFID3000	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
502	2	3200	0.90	hybrid	0	0.00	hybrid	FFID3310	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
503	2	3200	0.90	hybrid	0	0.00	hybrid	FFID350	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
504	2	3200	0.90	hybrid	0	0.00	hybrid	FFID355	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
505	2	3200	0.90	hybrid	0	0.00	hybrid	FFID360	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
506	2	3200	0.90	hybrid	0	0.00	hybrid	FFID3620	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
507	2	3200	0.90	hybrid	0	0.00	hybrid	FFID3640	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
508	2	3200	0.90	hybrid	0	0.00	hybrid	FFID3675	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
509	2	3200	0.90	hybrid	0	0.00	hybrid	FFID375	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
510	2	3200	0.90	hybrid	0	0.00	hybrid	FFID3800	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:51.87822	f	\N	\N	\N
511	2	3200	0.90	hybrid	0	0.00	hybrid	FFID40	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
512	2	3200	0.90	hybrid	0	0.00	hybrid	FFID400	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
513	2	3200	0.90	hybrid	0	0.00	hybrid	FFID4000	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
514	2	3200	0.90	hybrid	0	0.00	hybrid	FFID405	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
515	2	3200	0.90	hybrid	0	0.00	hybrid	FFID4050	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
516	2	3200	0.90	hybrid	0	0.00	hybrid	FFID420	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
520	2	3200	0.90	hybrid	0	0.00	hybrid	FFID455	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
521	2	3200	0.90	hybrid	0	0.00	hybrid	FFID4720	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
522	2	3200	0.90	hybrid	0	0.00	hybrid	FFID475	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
523	2	3200	0.90	hybrid	0	0.00	hybrid	FFID4800	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
524	2	3200	0.90	hybrid	0	0.00	hybrid	FFID4850	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
525	2	3200	0.90	hybrid	0	0.00	hybrid	FFID495	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
526	2	3200	0.90	hybrid	0	0.00	hybrid	FFID5	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:51.87822	f	\N	\N	\N
527	2	3200	0.90	hybrid	0	0.00	hybrid	FFID50	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
528	2	3200	0.90	hybrid	0	0.00	hybrid	FFID500	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
529	2	3200	0.90	hybrid	0	0.00	hybrid	FFID510	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
530	2	3200	0.90	hybrid	0	0.00	hybrid	FFID512	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
531	2	3200	0.90	hybrid	0	0.00	hybrid	FFID515	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
532	2	3200	0.90	hybrid	0	0.00	hybrid	FFID520	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
533	2	3200	0.90	hybrid	0	0.00	hybrid	FFID545	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
534	2	3200	0.90	hybrid	0	0.00	hybrid	FFID55	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
535	2	3200	0.90	hybrid	0	0.00	hybrid	FFID5500	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
536	2	3200	0.90	hybrid	0	0.00	hybrid	FFID5600	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
537	2	3200	0.90	hybrid	0	0.00	hybrid	FFID565	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
538	2	3200	0.90	hybrid	0	0.00	hybrid	FFID60	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
539	2	3200	0.90	hybrid	0	0.00	hybrid	FFID600	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
540	2	3200	0.90	hybrid	0	0.00	hybrid	FFID6000	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
541	2	3200	0.90	hybrid	0	0.00	hybrid	FFID635	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
542	2	3200	0.90	hybrid	0	0.00	hybrid	FFID645	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
543	2	3200	0.90	hybrid	0	0.00	hybrid	FFID6480	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
544	2	3200	0.90	hybrid	0	0.00	hybrid	FFID655	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
545	2	3200	0.90	hybrid	0	0.00	hybrid	FFID6550	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
546	2	3200	0.90	hybrid	0	0.00	hybrid	FFID6900	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
547	2	3200	0.90	hybrid	0	0.00	hybrid	FFID70	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
548	2	3200	0.90	hybrid	0	0.00	hybrid	FFID700	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
549	2	3200	0.90	hybrid	0	0.00	hybrid	FFID710	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
550	2	3200	0.90	hybrid	0	0.00	hybrid	FFID720	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
553	2	3200	0.90	hybrid	0	0.00	hybrid	FFID7295	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
562	2	3200	0.90	hybrid	0	0.00	hybrid	FFID770	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
563	2	3200	0.90	hybrid	0	0.00	hybrid	FFID790	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
564	2	3200	0.90	hybrid	0	0.00	hybrid	FFID80	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
565	2	3200	0.90	hybrid	0	0.00	hybrid	FFID800	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
566	2	3200	0.90	hybrid	0	0.00	hybrid	FFID8010	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
573	2	3200	0.90	hybrid	0	0.00	hybrid	FFID925	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
574	2	3200	0.90	hybrid	0	0.00	hybrid	FFID9290	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
575	2	3200	0.90	hybrid	0	0.00	hybrid	FFID930	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
576	2	3200	0.90	hybrid	0	0.00	hybrid	FFID95	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
577	2	3200	0.90	hybrid	0	0.00	hybrid	FFID9800	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
578	2	3200	0.90	hybrid	0	0.00	hybrid	FFLU10	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
579	2	3200	0.90	hybrid	0	0.00	hybrid	FFLU15	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
580	2	3200	0.90	hybrid	0	0.00	hybrid	FFLU20	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
581	2	3200	0.90	hybrid	0	0.00	hybrid	FFLU25	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
582	2	3200	0.90	hybrid	0	0.00	hybrid	FFLU30	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
583	2	3200	0.90	hybrid	0	0.00	hybrid	FFLU6	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
591	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY100	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
592	2	3200	0.90	hybrid	0	0.00	hybrid	FFMY1060	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
620	2	3200	0.90	hybrid	0	0.00	hybrid	FFSG5600	t	t	2025-10-23 16:18:15.842288	2025-11-17 03:43:52.00722	f	\N	\N	\N
1640	2	3200	12.00	hybrid	0	1.00	hybrid	FMFCP100	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	0001-01-01 00:00:00+00	0001-01-01 00:00:00+00
1641	2	3200	12.00	hybrid	0	1.00	hybrid	FMFCP1070	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	0001-01-01 00:00:00+00	0001-01-01 00:00:00+00
1642	2	3200	12.00	hybrid	0	1.00	hybrid	FMFCP12K	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	0001-01-01 00:00:00+00	0001-01-01 00:00:00+00
1643	2	3200	12.00	hybrid	0	1.00	hybrid	FMFCP2200	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	0001-01-01 00:00:00+00	0001-01-01 00:00:00+00
1644	2	3200	12.00	hybrid	0	1.00	hybrid	FMFCP40	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	0001-01-01 00:00:00+00	0001-01-01 00:00:00+00
1645	2	3200	12.00	hybrid	0	1.00	hybrid	FMFCP520	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	0001-01-01 00:00:00+00	0001-01-01 00:00:00+00
1646	2	3200	12.00	hybrid	0	1.00	hybrid	FMFCP5750	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	0001-01-01 00:00:00+00	0001-01-01 00:00:00+00
1647	2	3200	12.00	hybrid	0	1.00	hybrid	FMSVR1999	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	0001-01-01 00:00:00+00	0001-01-01 00:00:00+00
1648	2	3200	12.00	hybrid	0	1.00	hybrid	FMSVR39	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	0001-01-01 00:00:00+00	0001-01-01 00:00:00+00
1649	2	3200	12.00	hybrid	0	1.00	hybrid	FMSVR499	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	0001-01-01 00:00:00+00	0001-01-01 00:00:00+00
1650	2	3200	12.00	hybrid	0	1.00	hybrid	FMSVR4999	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	0001-01-01 00:00:00+00	0001-01-01 00:00:00+00
1717	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCRT2	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1718	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCRT3	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1719	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCRT4	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1720	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCRT5	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1721	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCRT6	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1722	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCU1	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1723	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCU2	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1724	2	3200	12.00	hybrid	0	0.00	hybrid	HFRCU3	t	t	2025-10-30 17:39:38.197971	2025-11-17 03:43:52.00722	f	0	\N	\N
1748	2	3200	12.00	hybrid	0	0.00	hybrid	HIBC30	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1749	2	3200	12.00	hybrid	0	0.00	hybrid	HIBC330	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1750	2	3200	12.00	hybrid	0	0.00	hybrid	HIBC3300	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1751	2	3200	12.00	hybrid	0	0.00	hybrid	HIBC65	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1752	2	3200	12.00	hybrid	0	0.00	hybrid	HIBC6600	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1753	2	3200	12.00	hybrid	0	0.00	hybrid	HIBC990	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1754	2	3200	12.00	hybrid	0	0.00	hybrid	HICR1320	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1755	2	3200	12.00	hybrid	0	0.00	hybrid	HICR330	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1756	2	3200	12.00	hybrid	0	0.00	hybrid	HICR3300	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1757	2	3200	12.00	hybrid	0	0.00	hybrid	HICR65	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1758	2	3200	12.00	hybrid	0	0.00	hybrid	HICR660	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1759	2	3200	12.00	hybrid	0	0.00	hybrid	HICR6600	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1760	2	3200	12.00	hybrid	0	0.00	hybrid	HISIMC	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1761	2	3200	12.00	hybrid	0	0.00	hybrid	HKCDWC	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1762	2	3200	12.00	hybrid	0	0.00	hybrid	HKCDWCP	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1763	2	3200	12.00	hybrid	0	0.00	hybrid	HKTO1200	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.00722	f	0	\N	\N
1764	2	3200	12.00	hybrid	0	0.00	hybrid	HKTO16	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1765	2	3200	12.00	hybrid	0	0.00	hybrid	HKTO23	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1766	2	3200	12.00	hybrid	0	0.00	hybrid	HKTO240	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1767	2	3200	12.00	hybrid	0	0.00	hybrid	HKTO2400	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1768	2	3200	12.00	hybrid	0	0.00	hybrid	HKTO400	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1769	2	3200	12.00	hybrid	0	0.00	hybrid	HKTO4000	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1770	2	3200	12.00	hybrid	0	0.00	hybrid	HKTO560	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1771	2	3200	12.00	hybrid	0	0.00	hybrid	HKTO8	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1772	2	3200	12.00	hybrid	0	0.00	hybrid	HKTO80	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1773	2	3200	12.00	hybrid	0	0.00	hybrid	HKTO800	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1774	2	3200	12.00	hybrid	0	0.00	hybrid	HKTO8000	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1775	2	3200	12.00	hybrid	0	0.00	hybrid	HPJW1280	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1776	2	3200	12.00	hybrid	0	0.00	hybrid	HPJW1980	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1777	2	3200	12.00	hybrid	0	0.00	hybrid	HPJW300	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1778	2	3200	12.00	hybrid	0	0.00	hybrid	HPJW3280	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1779	2	3200	12.00	hybrid	0	0.00	hybrid	HPJW60	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1780	2	3200	12.00	hybrid	0	0.00	hybrid	HPJW6480	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1781	2	3200	12.00	hybrid	0	0.00	hybrid	HPJW680	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1782	2	3200	12.00	hybrid	0	0.00	hybrid	HPJW980	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1783	2	3200	12.00	hybrid	0	0.00	hybrid	HSOS1280	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1784	2	3200	12.00	hybrid	0	0.00	hybrid	HSOS1980	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1785	2	3200	12.00	hybrid	0	0.00	hybrid	HSOS300	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1786	2	3200	12.00	hybrid	0	0.00	hybrid	HSOS3280	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1788	2	3200	12.00	hybrid	0	0.00	hybrid	HSOS60	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1789	2	3200	12.00	hybrid	0	0.00	hybrid	HSOS6480	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1790	2	3200	12.00	hybrid	0	0.00	hybrid	HSOS980	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1791	2	3200	12.00	hybrid	0	0.00	hybrid	HSPGE	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1792	2	3200	12.00	hybrid	0	0.00	hybrid	HSPGEX2	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1793	2	3200	12.00	hybrid	0	0.00	hybrid	HSPGEX3	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1794	2	3200	12.00	hybrid	0	0.00	hybrid	HSPGEX4	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1795	2	3200	12.00	hybrid	0	0.00	hybrid	HSPGEX5	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1796	2	3200	12.00	hybrid	0	0.00	hybrid	HUGM1200G	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1797	2	3200	12.00	hybrid	0	0.00	hybrid	HUGM150DC	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1798	2	3200	12.00	hybrid	0	0.00	hybrid	HUGM16KG	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1799	2	3200	12.00	hybrid	0	0.00	hybrid	HUGM220G	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1800	2	3200	12.00	hybrid	0	0.00	hybrid	HUGM2400G	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1801	2	3200	12.00	hybrid	0	0.00	hybrid	HUGM36KG	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1802	2	3200	12.00	hybrid	0	0.00	hybrid	HUGM8500G	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1803	2	3200	12.00	hybrid	0	0.00	hybrid	HUGM950DO	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1804	2	3200	12.00	hybrid	0	0.00	hybrid	HUGM95DC	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1805	2	3200	12.00	hybrid	0	0.00	hybrid	HUGMAP	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1806	2	3200	12.00	hybrid	0	0.00	hybrid	IVEC185	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1807	2	3200	12.00	hybrid	0	0.00	hybrid	IVEC2025	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1808	2	3200	12.00	hybrid	0	0.00	hybrid	IVEC305	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1809	2	3200	12.00	hybrid	0	0.00	hybrid	IVEC3330	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1810	2	3200	12.00	hybrid	0	0.00	hybrid	IVEC60	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1811	2	3200	12.00	hybrid	0	0.00	hybrid	IVEC6590	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1812	2	3200	12.00	hybrid	0	0.00	hybrid	IVEC690	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1813	2	3200	12.00	hybrid	0	0.00	hybrid	IVPCCP	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1814	2	3200	12.00	hybrid	0	0.00	hybrid	IVPCIP	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1815	2	3200	12.00	hybrid	0	0.00	hybrid	IVPCMSP	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1816	2	3200	12.00	hybrid	0	0.00	hybrid	KCDM10	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1817	2	3200	12.00	hybrid	0	0.00	hybrid	KCDM132	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1818	2	3200	12.00	hybrid	0	0.00	hybrid	KCDM1360	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1833	2	3200	12.00	hybrid	0	0.00	hybrid	LA200	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1834	2	3200	12.00	hybrid	0	0.00	hybrid	LA25	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1835	2	3200	12.00	hybrid	0	0.00	hybrid	LA250	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1836	2	3200	12.00	hybrid	0	0.00	hybrid	LA30	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1837	2	3200	12.00	hybrid	0	0.00	hybrid	LA300	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1838	2	3200	12.00	hybrid	0	0.00	hybrid	LA35	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1839	2	3200	12.00	hybrid	0	0.00	hybrid	LA40	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1840	2	3200	12.00	hybrid	0	0.00	hybrid	LA400	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1841	2	3200	12.00	hybrid	0	0.00	hybrid	LA45	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1842	2	3200	12.00	hybrid	0	0.00	hybrid	LA50	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1843	2	3200	12.00	hybrid	0	0.00	hybrid	LA500	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1844	2	3200	12.00	hybrid	0	0.00	hybrid	LA55	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1845	2	3200	12.00	hybrid	0	0.00	hybrid	LA60	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1846	2	3200	12.00	hybrid	0	0.00	hybrid	LA65	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1847	2	3200	12.00	hybrid	0	0.00	hybrid	LA70	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1848	2	3200	12.00	hybrid	0	0.00	hybrid	LA75	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1849	2	3200	12.00	hybrid	0	0.00	hybrid	LA80	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1850	2	3200	12.00	hybrid	0	0.00	hybrid	LA85	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1851	2	3200	12.00	hybrid	0	0.00	hybrid	LA90	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1852	2	3200	12.00	hybrid	0	0.00	hybrid	LA95	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1853	2	3200	12.00	hybrid	0	0.00	hybrid	LECO1000	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1854	2	3200	12.00	hybrid	0	0.00	hybrid	LECO2000	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1855	2	3200	12.00	hybrid	0	0.00	hybrid	LECO500	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1856	2	3200	12.00	hybrid	0	0.00	hybrid	LECO5000	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1857	2	3200	12.00	hybrid	0	0.00	hybrid	LFTO130	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1858	2	3200	12.00	hybrid	0	0.00	hybrid	LFTO1410	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1859	2	3200	12.00	hybrid	0	0.00	hybrid	LFTO2180	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1860	2	3200	12.00	hybrid	0	0.00	hybrid	LFTO330	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1861	2	3200	12.00	hybrid	0	0.00	hybrid	LFTO3610	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1862	2	3200	12.00	hybrid	0	0.00	hybrid	LFTO70	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1863	2	3200	12.00	hybrid	0	0.00	hybrid	LFTO7130	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1864	2	3200	12.00	hybrid	0	0.00	hybrid	LFTO750	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1865	2	3200	12.00	hybrid	0	0.00	hybrid	LFTO990	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1866	2	3200	12.00	hybrid	0	0.00	hybrid	LLID1000	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1867	2	3200	12.00	hybrid	0	0.00	hybrid	LLID10000	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1868	2	3200	12.00	hybrid	0	0.00	hybrid	LLID1850	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1869	2	3200	12.00	hybrid	0	0.00	hybrid	LLID3275	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1870	2	3200	12.00	hybrid	0	0.00	hybrid	LLID425	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1871	2	3200	12.00	hybrid	0	0.00	hybrid	LLID4800	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1872	2	3200	12.00	hybrid	0	0.00	hybrid	LLMY1000	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1873	2	3200	12.00	hybrid	0	0.00	hybrid	LLMY100000	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1874	2	3200	12.00	hybrid	0	0.00	hybrid	LLMY1850	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1875	2	3200	12.00	hybrid	0	0.00	hybrid	LLMY3275	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1876	2	3200	12.00	hybrid	0	0.00	hybrid	LLMY425	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1877	2	3200	12.00	hybrid	0	0.00	hybrid	LLMY4800	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1884	2	3200	12.00	hybrid	0	0.00	hybrid	LLPH1000	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1885	2	3200	12.00	hybrid	0	0.00	hybrid	LLPH10000	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1888	2	3200	12.00	hybrid	0	0.00	hybrid	LLPH1850	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1890	2	3200	12.00	hybrid	0	0.00	hybrid	LLPH3275	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1891	2	3200	12.00	hybrid	0	0.00	hybrid	LLPH425	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1893	2	3200	12.00	hybrid	0	0.00	hybrid	LLPH4800	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1896	2	3200	12.00	hybrid	0	0.00	hybrid	LMDO1999	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1897	2	3200	12.00	hybrid	0	0.00	hybrid	LMDO29K	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1898	2	3200	12.00	hybrid	0	0.00	hybrid	LMDO499	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1899	2	3200	12.00	hybrid	0	0.00	hybrid	LMDO4999	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1900	2	3200	12.00	hybrid	0	0.00	hybrid	LMDO59K	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1901	2	3200	12.00	hybrid	0	0.00	hybrid	LMDO99	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1902	2	3200	12.00	hybrid	0	0.00	hybrid	LMDO999	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
1903	2	3200	12.00	hybrid	0	0.00	hybrid	LMDO9999	t	t	2025-10-30 17:39:38.371701	2025-11-17 03:43:52.119397	f	0	\N	\N
312	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR1220	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
313	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR1412	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
314	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR1669	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
315	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR172	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
316	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR2195	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
317	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR257	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
318	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR2901	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
319	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR3073	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
320	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR344	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
321	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR429	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
322	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR514	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
323	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR600	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
324	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR706	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
325	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR792	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
326	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR86	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
327	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR878	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
328	2	3200	0.90	hybrid	0	0.00	hybrid	MLBR963	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
329	2	3200	0.90	hybrid	0	0.00	hybrid	MLID10	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
330	2	3200	0.90	hybrid	0	0.00	hybrid	MLID100	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
331	2	3200	0.90	hybrid	0	0.00	hybrid	MLID112	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
332	2	3200	0.90	hybrid	0	0.00	hybrid	MLID1159	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
333	2	3200	0.90	hybrid	0	0.00	hybrid	MLID12	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
334	2	3200	0.90	hybrid	0	0.00	hybrid	MLID14	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
335	2	3200	0.90	hybrid	0	0.00	hybrid	MLID140	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
336	2	3200	0.90	hybrid	0	0.00	hybrid	MLID1412	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
337	2	3200	0.90	hybrid	0	0.00	hybrid	MLID15	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
338	2	3200	0.90	hybrid	0	0.00	hybrid	MLID153	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
339	2	3200	0.90	hybrid	0	0.00	hybrid	MLID172	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
340	2	3200	0.90	hybrid	0	0.00	hybrid	MLID1830	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
341	2	3200	0.90	hybrid	0	0.00	hybrid	MLID185	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
342	2	3200	0.90	hybrid	0	0.00	hybrid	MLID19	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
343	2	3200	0.90	hybrid	0	0.00	hybrid	MLID2010	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
344	2	3200	0.90	hybrid	0	0.00	hybrid	MLID2195	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
345	2	3200	0.90	hybrid	0	0.00	hybrid	MLID22	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
346	2	3200	0.90	hybrid	0	0.00	hybrid	MLID240	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
348	2	3200	0.90	hybrid	0	0.00	hybrid	MLID279	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
349	2	3200	0.90	hybrid	0	0.00	hybrid	MLID28	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
350	2	3200	0.90	hybrid	0	0.00	hybrid	MLID282	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
351	2	3200	0.90	hybrid	0	0.00	hybrid	MLID296	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
352	2	3200	0.90	hybrid	0	0.00	hybrid	MLID3	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	t	1000	2025-11-05 06:47:00+00	2025-11-07 06:47:00+00
353	2	3200	0.90	hybrid	0	0.00	hybrid	MLID33	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
354	2	3200	0.90	hybrid	0	0.00	hybrid	MLID336	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
355	2	3200	0.90	hybrid	0	0.00	hybrid	MLID344	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
356	2	3200	0.90	hybrid	0	0.00	hybrid	MLID350	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
357	2	3200	0.90	hybrid	0	0.00	hybrid	MLID36	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
358	2	3200	0.90	hybrid	0	0.00	hybrid	MLID366	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
359	2	3200	0.90	hybrid	0	0.00	hybrid	MLID370	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
360	2	3200	0.90	hybrid	0	0.00	hybrid	MLID380	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
361	2	3200	0.90	hybrid	0	0.00	hybrid	MLID408	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
362	2	3200	0.90	hybrid	0	0.00	hybrid	MLID415	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
363	2	3200	0.90	hybrid	0	0.00	hybrid	MLID42	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
364	2	3200	0.90	hybrid	0	0.00	hybrid	MLID429	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
365	2	3200	0.90	hybrid	0	0.00	hybrid	MLID448	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
366	2	3200	0.90	hybrid	0	0.00	hybrid	MLID45	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
367	2	3200	0.90	hybrid	0	0.00	hybrid	MLID460	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
368	2	3200	0.90	hybrid	0	0.00	hybrid	MLID5	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
369	2	3200	0.90	hybrid	0	0.00	hybrid	MLID50	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
370	2	3200	0.90	hybrid	0	0.00	hybrid	MLID514	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
371	2	3200	0.90	hybrid	0	0.00	hybrid	MLID56	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
372	2	3200	0.90	hybrid	0	0.00	hybrid	MLID568	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
373	2	3200	0.90	hybrid	0	0.00	hybrid	MLID59	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
374	2	3200	0.90	hybrid	0	0.00	hybrid	MLID600	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
375	2	3200	0.90	hybrid	0	0.00	hybrid	MLID67	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
376	2	3200	0.90	hybrid	0	0.00	hybrid	MLID70	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
377	2	3200	0.90	hybrid	0	0.00	hybrid	MLID706	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
378	2	3200	0.90	hybrid	0	0.00	hybrid	MLID715	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
379	2	3200	0.90	hybrid	0	0.00	hybrid	MLID738	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
380	2	3200	0.90	hybrid	0	0.00	hybrid	MLID75	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
381	2	3200	0.90	hybrid	0	0.00	hybrid	MLID760	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
382	2	3200	0.90	hybrid	0	0.00	hybrid	MLID8	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
383	2	3200	0.90	hybrid	0	0.00	hybrid	MLID85	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
384	2	3200	0.90	hybrid	0	0.00	hybrid	MLID878	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.119397	f	\N	\N	\N
386	2	3200	0.90	hybrid	0	0.00	hybrid	MLID963	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.230222	f	\N	\N	\N
387	2	3200	0.90	hybrid	0	0.00	hybrid	MLMSBR1	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.230222	f	\N	\N	\N
388	2	3200	0.90	hybrid	0	0.00	hybrid	MLMSBR2	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.230222	f	\N	\N	\N
389	2	3200	0.90	hybrid	0	0.00	hybrid	MLMSBR3	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.230222	f	\N	\N	\N
390	2	3200	0.90	hybrid	0	0.00	hybrid	MLMSBR4	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.230222	f	\N	\N	\N
391	2	3200	0.90	hybrid	0	0.00	hybrid	MLMSBR5	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.230222	f	\N	\N	\N
392	2	3200	0.90	hybrid	0	0.00	hybrid	MLMSID1	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.230222	f	\N	\N	\N
393	2	3200	0.90	hybrid	0	0.00	hybrid	MLMSID2	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.230222	f	\N	\N	\N
394	2	3200	0.90	hybrid	0	0.00	hybrid	MLMSID3	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.230222	f	\N	\N	\N
395	2	3200	0.90	hybrid	0	0.00	hybrid	MLMSID4	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.230222	f	\N	\N	\N
396	2	3200	0.90	hybrid	0	0.00	hybrid	MLMSID5	t	t	2025-10-23 16:18:15.678218	2025-11-17 03:43:52.230222	f	\N	\N	\N
2052	2	3200	12.00	hybrid	0	0.00	hybrid	SM100	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2053	2	3200	12.00	hybrid	0	0.00	hybrid	SM11	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2054	2	3200	12.00	hybrid	0	0.00	hybrid	SM12	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2055	2	3200	12.00	hybrid	0	0.00	hybrid	SM15	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2056	2	3200	12.00	hybrid	0	0.00	hybrid	SM150	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2057	2	3200	12.00	hybrid	0	0.00	hybrid	SM2	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2058	2	3200	12.00	hybrid	0	0.00	hybrid	SM20	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2059	2	3200	12.00	hybrid	0	0.00	hybrid	SM200	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2060	2	3200	12.00	hybrid	0	0.00	hybrid	SM25	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2061	2	3200	12.00	hybrid	0	0.00	hybrid	SM3	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2062	2	3200	12.00	hybrid	0	0.00	hybrid	SM30	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2063	2	3200	12.00	hybrid	0	0.00	hybrid	SM35	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2064	2	3200	12.00	hybrid	0	0.00	hybrid	SM4	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2065	2	3200	12.00	hybrid	0	0.00	hybrid	SM40	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2066	2	3200	12.00	hybrid	0	0.00	hybrid	SM45	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2067	2	3200	12.00	hybrid	0	0.00	hybrid	SM5	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2068	2	3200	12.00	hybrid	0	0.00	hybrid	SM50	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2069	2	3200	12.00	hybrid	0	0.00	hybrid	SM55	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2070	2	3200	12.00	hybrid	0	0.00	hybrid	SM6	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2071	2	3200	12.00	hybrid	0	0.00	hybrid	SM60	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2072	2	3200	12.00	hybrid	0	0.00	hybrid	SM65	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2073	2	3200	12.00	hybrid	0	0.00	hybrid	SM7	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2074	2	3200	12.00	hybrid	0	0.00	hybrid	SM70	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2075	2	3200	12.00	hybrid	0	0.00	hybrid	SM75	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2076	2	3200	12.00	hybrid	0	0.00	hybrid	SM8	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2077	2	3200	12.00	hybrid	0	0.00	hybrid	SM80	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2078	2	3200	12.00	hybrid	0	0.00	hybrid	SM85	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2079	2	3200	12.00	hybrid	0	0.00	hybrid	SM9	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2080	2	3200	12.00	hybrid	0	0.00	hybrid	SM90	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2081	2	3200	12.00	hybrid	0	0.00	hybrid	SM95	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2082	2	3200	12.00	hybrid	0	0.00	hybrid	L2DM100	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2083	2	3200	12.00	hybrid	0	0.00	hybrid	L2DM120	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2084	2	3200	12.00	hybrid	0	0.00	hybrid	L2DM1K	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2085	2	3200	12.00	hybrid	0	0.00	hybrid	L2DM1K2	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2086	2	3200	12.00	hybrid	0	0.00	hybrid	L2DM200	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2087	2	3200	12.00	hybrid	0	0.00	hybrid	L2DM2K	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2088	2	3200	12.00	hybrid	0	0.00	hybrid	L2DM40	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2089	2	3200	12.00	hybrid	0	0.00	hybrid	L2DM400	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2090	2	3200	12.00	hybrid	0	0.00	hybrid	L2DM4K	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2091	2	3200	12.00	hybrid	0	0.00	hybrid	L2PCAB1	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2092	2	3200	12.00	hybrid	0	0.00	hybrid	L2PCAB2	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2093	2	3200	12.00	hybrid	0	0.00	hybrid	L2PCAB3	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2101	2	3200	12.00	hybrid	0	0.00	hybrid	LDCR300	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2102	2	3200	12.00	hybrid	0	0.00	hybrid	LDCR3280	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2103	2	3200	12.00	hybrid	0	0.00	hybrid	LDCR450	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2104	2	3200	12.00	hybrid	0	0.00	hybrid	LDCR60	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2105	2	3200	12.00	hybrid	0	0.00	hybrid	LDCR6480	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2106	2	3200	12.00	hybrid	0	0.00	hybrid	LDCR980	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2107	2	3200	12.00	hybrid	0	0.00	hybrid	LDPPAP	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2108	2	3200	12.00	hybrid	0	0.00	hybrid	LDPPCP	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2109	2	3200	12.00	hybrid	0	0.00	hybrid	LRID1000	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2110	2	3200	12.00	hybrid	0	0.00	hybrid	LRID11K	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2111	2	3200	12.00	hybrid	0	0.00	hybrid	LRID2050	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2112	2	3200	12.00	hybrid	0	0.00	hybrid	LRID3650	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2113	2	3200	12.00	hybrid	0	0.00	hybrid	LRID475	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2114	2	3200	12.00	hybrid	0	0.00	hybrid	LRID5350	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2115	2	3200	12.00	hybrid	0	0.00	hybrid	LRMY1000	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2116	2	3200	12.00	hybrid	0	0.00	hybrid	LRMY11K	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2117	2	3200	12.00	hybrid	0	0.00	hybrid	LRMY2050	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2118	2	3200	12.00	hybrid	0	0.00	hybrid	LRMY3650	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2119	2	3200	12.00	hybrid	0	0.00	hybrid	LRMY475	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2120	2	3200	12.00	hybrid	0	0.00	hybrid	LRMY5350	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2121	2	3200	12.00	hybrid	0	0.00	hybrid	LRPH1000	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2122	2	3200	12.00	hybrid	0	0.00	hybrid	LRPH11K	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2123	2	3200	12.00	hybrid	0	0.00	hybrid	LRPH2050	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2124	2	3200	12.00	hybrid	0	0.00	hybrid	LRPH3650	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2125	2	3200	12.00	hybrid	0	0.00	hybrid	LRPH475	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2126	2	3200	12.00	hybrid	0	0.00	hybrid	LRPH5350	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2127	2	3200	12.00	hybrid	0	0.00	hybrid	LTCY1350	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2128	2	3200	12.00	hybrid	0	0.00	hybrid	LTCY15000	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2129	2	3200	12.00	hybrid	0	0.00	hybrid	LTCY1800	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2130	2	3200	12.00	hybrid	0	0.00	hybrid	LTCY2250	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2131	2	3200	12.00	hybrid	0	0.00	hybrid	LTCY2980	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2132	2	3200	12.00	hybrid	0	0.00	hybrid	LTCY450	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2133	2	3200	12.00	hybrid	0	0.00	hybrid	LTCY4500	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2134	2	3200	12.00	hybrid	0	0.00	hybrid	LTCY630	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2135	2	3200	12.00	hybrid	0	0.00	hybrid	LTCY6300	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2136	2	3200	12.00	hybrid	0	0.00	hybrid	LTCY90	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2137	2	3200	12.00	hybrid	0	0.00	hybrid	LTCY900	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2138	2	3200	12.00	hybrid	0	0.00	hybrid	LTCY9000	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2139	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDD12	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2140	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDD170	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2141	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDD19	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2142	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDD2010	t	t	2025-10-30 17:39:38.528977	2025-11-17 03:43:52.230222	f	0	\N	\N
2143	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDD240	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2144	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDD28	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2145	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDD296	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2146	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDD408	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2147	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDD44	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2148	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDD4830	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2149	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDD5	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2150	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDD568	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2151	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDD59	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2152	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDD85	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2153	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDD875	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2154	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDF100	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2155	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDF1K	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2156	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDF300	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2157	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDF500	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2158	2	3200	12.00	hybrid	0	0.00	hybrid	MCIDWWC1	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2159	2	3200	12.00	hybrid	0	0.00	hybrid	MDSD120	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2160	2	3200	12.00	hybrid	0	0.00	hybrid	MDSD30	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2161	2	3200	12.00	hybrid	0	0.00	hybrid	MDSD300	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2162	2	3200	12.00	hybrid	0	0.00	hybrid	MDSD6	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2163	2	3200	12.00	hybrid	0	0.00	hybrid	MDSD60	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2164	2	3200	12.00	hybrid	0	0.00	hybrid	MDSD600	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2165	2	3200	12.00	hybrid	0	0.00	hybrid	M2BD10K	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2166	2	3200	12.00	hybrid	0	0.00	hybrid	M2BD115	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2167	2	3200	12.00	hybrid	0	0.00	hybrid	M2BD1297	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2168	2	3200	12.00	hybrid	0	0.00	hybrid	M2BD1907	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2169	2	3200	12.00	hybrid	0	0.00	hybrid	M2BD20K	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2170	2	3200	12.00	hybrid	0	0.00	hybrid	M2BD2288	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2171	2	3200	12.00	hybrid	0	0.00	hybrid	M2BD23	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2172	2	3200	12.00	hybrid	0	0.00	hybrid	M2BD267	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2173	2	3200	12.00	hybrid	0	0.00	hybrid	M2BD30K	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2174	2	3200	12.00	hybrid	0	0.00	hybrid	M2BD40K	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2175	2	3200	12.00	hybrid	0	0.00	hybrid	M2BD488	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2176	2	3200	12.00	hybrid	0	0.00	hybrid	M2BD50K	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2177	2	3200	12.00	hybrid	0	0.00	hybrid	M2BD61	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2178	2	3200	12.00	hybrid	0	0.00	hybrid	M2BD6482	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2179	2	3200	12.00	hybrid	0	0.00	hybrid	M2BD839	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2180	2	3200	12.00	hybrid	0	0.00	hybrid	M2DD110	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2181	2	3200	12.00	hybrid	0	0.00	hybrid	M2DD1236	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2182	2	3200	12.00	hybrid	0	0.00	hybrid	M2DD1786	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2183	2	3200	12.00	hybrid	0	0.00	hybrid	M2DD2403	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2184	2	3200	12.00	hybrid	0	0.00	hybrid	M2DD248	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2185	2	3200	12.00	hybrid	0	0.00	hybrid	M2DD28	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2186	2	3200	12.00	hybrid	0	0.00	hybrid	M2DD447	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2187	2	3200	12.00	hybrid	0	0.00	hybrid	M2DD59	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2188	2	3200	12.00	hybrid	0	0.00	hybrid	M2DD6130	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2189	2	3200	12.00	hybrid	0	0.00	hybrid	M2DD824	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2190	2	3200	12.00	hybrid	0	0.00	hybrid	M31050	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2191	2	3200	12.00	hybrid	0	0.00	hybrid	M32100	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2192	2	3200	12.00	hybrid	0	0.00	hybrid	M3350	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2193	2	3200	12.00	hybrid	0	0.00	hybrid	M33500	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2194	2	3200	12.00	hybrid	0	0.00	hybrid	M370	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2195	2	3200	12.00	hybrid	0	0.00	hybrid	M37000	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2196	2	3200	12.00	hybrid	0	0.00	hybrid	MAID1300	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2197	2	3200	12.00	hybrid	0	0.00	hybrid	MAID310	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2198	2	3200	12.00	hybrid	0	0.00	hybrid	MAID3200	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2199	2	3200	12.00	hybrid	0	0.00	hybrid	MAID60	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2200	2	3200	12.00	hybrid	0	0.00	hybrid	MAID630	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2201	2	3200	12.00	hybrid	0	0.00	hybrid	MAID6500	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2202	2	3200	12.00	hybrid	0	0.00	hybrid	MAIDAP1	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2203	2	3200	12.00	hybrid	0	0.00	hybrid	MAIDAP10	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2204	2	3200	12.00	hybrid	0	0.00	hybrid	MAIDAP20	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2205	2	3200	12.00	hybrid	0	0.00	hybrid	MAIDMC	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2206	2	3200	12.00	hybrid	0	0.00	hybrid	MAIDMC3	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2207	2	3200	12.00	hybrid	0	0.00	hybrid	MAIDPMC	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2208	2	3200	12.00	hybrid	0	0.00	hybrid	MAIDPMC3	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2209	2	3200	12.00	hybrid	0	0.00	hybrid	MAIDPSP	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2210	2	3200	12.00	hybrid	0	0.00	hybrid	MAIDRP1	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2211	2	3200	12.00	hybrid	0	0.00	hybrid	MAIDRP10	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2212	2	3200	12.00	hybrid	0	0.00	hybrid	MAIDRP20	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2213	2	3200	12.00	hybrid	0	0.00	hybrid	MAIDSP1	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2214	2	3200	12.00	hybrid	0	0.00	hybrid	MAIDSP10	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2215	2	3200	12.00	hybrid	0	0.00	hybrid	MAIDSP20	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2216	2	3200	12.00	hybrid	0	0.00	hybrid	MAIDSSP	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2217	2	3200	12.00	hybrid	0	0.00	hybrid	MBPPAGFA	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2218	2	3200	12.00	hybrid	0	0.00	hybrid	MBPPAGFN	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2219	2	3200	12.00	hybrid	0	0.00	hybrid	MBPPBP	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2220	2	3200	12.00	hybrid	0	0.00	hybrid	MBPPDBM	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2221	2	3200	12.00	hybrid	0	0.00	hybrid	MBPPDBW	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2222	2	3200	12.00	hybrid	0	0.00	hybrid	MBPPSVHP	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2223	2	3200	12.00	hybrid	0	0.00	hybrid	MBPPTVP	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2224	2	3200	12.00	hybrid	0	0.00	hybrid	MLMSYTP	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2225	2	3200	12.00	hybrid	0	0.00	hybrid	NIIC100	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2226	2	3200	12.00	hybrid	0	0.00	hybrid	NIIC1000	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2227	2	3200	12.00	hybrid	0	0.00	hybrid	NIIC10000	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.230222	f	0	\N	\N
2228	2	3200	12.00	hybrid	0	0.00	hybrid	NIIC200	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2229	2	3200	12.00	hybrid	0	0.00	hybrid	NIIC2000	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2230	2	3200	12.00	hybrid	0	0.00	hybrid	NIIC3000	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2231	2	3200	12.00	hybrid	0	0.00	hybrid	NIIC500	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2232	2	3200	12.00	hybrid	0	0.00	hybrid	NIIC5000	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2233	2	3200	12.00	hybrid	0	0.00	hybrid	OAJA1280	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2234	2	3200	12.00	hybrid	0	0.00	hybrid	OAJA300	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2235	2	3200	12.00	hybrid	0	0.00	hybrid	OAJA3280	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2236	2	3200	12.00	hybrid	0	0.00	hybrid	OAJA60	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2237	2	3200	12.00	hybrid	0	0.00	hybrid	OAJA6480	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2238	2	3200	12.00	hybrid	0	0.00	hybrid	OAJA680	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2239	2	3200	12.00	hybrid	0	0.00	hybrid	OHCG1120	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2240	2	3200	12.00	hybrid	0	0.00	hybrid	OHCG2340	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2241	2	3200	12.00	hybrid	0	0.00	hybrid	OHCG339	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2242	2	3200	12.00	hybrid	0	0.00	hybrid	OHCG3979	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2243	2	3200	12.00	hybrid	0	0.00	hybrid	OHCG62	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2244	2	3200	12.00	hybrid	0	0.00	hybrid	OHCG8075	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2245	2	3200	12.00	hybrid	0	0.00	hybrid	OHPPBA	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2246	2	3200	12.00	hybrid	0	0.00	hybrid	OHPPBD	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2247	2	3200	12.00	hybrid	0	0.00	hybrid	OHPPMP	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2248	2	3200	12.00	hybrid	0	0.00	hybrid	OPKP107	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2249	2	3200	12.00	hybrid	0	0.00	hybrid	OPKP13	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2250	2	3200	12.00	hybrid	0	0.00	hybrid	OPKP214	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2251	2	3200	12.00	hybrid	0	0.00	hybrid	OPKP22	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2252	2	3200	12.00	hybrid	0	0.00	hybrid	OPKP227	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2275	2	3200	12.00	hybrid	0	0.00	hybrid	PNUC300	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2276	2	3200	12.00	hybrid	0	0.00	hybrid	PNUC3280	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2277	2	3200	12.00	hybrid	0	0.00	hybrid	PNUC60	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2278	2	3200	12.00	hybrid	0	0.00	hybrid	PNUC6480	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2279	2	3200	12.00	hybrid	0	0.00	hybrid	PNUC980	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2280	2	3200	12.00	hybrid	0	0.00	hybrid	PUAG1350	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2281	2	3200	12.00	hybrid	0	0.00	hybrid	PUAG250	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2282	2	3200	12.00	hybrid	0	0.00	hybrid	PUAG2740	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2283	2	3200	12.00	hybrid	0	0.00	hybrid	PUAG3500	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2284	2	3200	12.00	hybrid	0	0.00	hybrid	PUAG525	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2285	2	3200	12.00	hybrid	0	0.00	hybrid	PUAG60	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
2286	2	3200	12.00	hybrid	0	0.00	hybrid	PUAG7100	t	t	2025-10-30 17:39:38.688555	2025-11-17 03:43:52.343028	f	0	\N	\N
5500	2	3200	12.00	hybrid	0	0.00	hybrid	RCKACA	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5501	2	3200	12.00	hybrid	0	0.00	hybrid	RCKAUA	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5502	2	3200	12.00	hybrid	0	0.00	hybrid	RCMLAD	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5503	2	3200	12.00	hybrid	0	0.00	hybrid	RCMLPD	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5504	2	3200	12.00	hybrid	0	0.00	hybrid	RCZN1	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5505	2	3200	12.00	hybrid	0	0.00	hybrid	RCZN12	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5506	2	3200	12.00	hybrid	0	0.00	hybrid	RCZN144	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5507	2	3200	12.00	hybrid	0	0.00	hybrid	RCZN3	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5508	2	3200	12.00	hybrid	0	0.00	hybrid	RCZN32	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5509	2	3200	12.00	hybrid	0	0.00	hybrid	RCZN360	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5510	2	3200	12.00	hybrid	0	0.00	hybrid	RCZN6	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5511	2	3200	12.00	hybrid	0	0.00	hybrid	RCZN64	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5512	2	3200	12.00	hybrid	0	0.00	hybrid	REBCC12	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5513	2	3200	12.00	hybrid	0	0.00	hybrid	REBCC120	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5514	2	3200	12.00	hybrid	0	0.00	hybrid	REBCC18	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5515	2	3200	12.00	hybrid	0	0.00	hybrid	REBCC24	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5516	2	3200	12.00	hybrid	0	0.00	hybrid	REBCC298	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5517	2	3200	12.00	hybrid	0	0.00	hybrid	REBCC30	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5518	2	3200	12.00	hybrid	0	0.00	hybrid	REBCC598	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5519	2	3200	12.00	hybrid	0	0.00	hybrid	REBCC6	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5520	2	3200	12.00	hybrid	0	0.00	hybrid	REBCC60	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5521	2	3200	12.00	hybrid	0	0.00	hybrid	REPPLS	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5522	2	3200	12.00	hybrid	0	0.00	hybrid	RIJA1058	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5523	2	3200	12.00	hybrid	0	0.00	hybrid	RIJA10K5	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5524	2	3200	12.00	hybrid	0	0.00	hybrid	RIJA127	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5525	2	3200	12.00	hybrid	0	0.00	hybrid	RIJA1323	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5526	2	3200	12.00	hybrid	0	0.00	hybrid	RIJA1587	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5527	2	3200	12.00	hybrid	0	0.00	hybrid	RIJA1852	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5528	2	3200	12.00	hybrid	0	0.00	hybrid	RIJA2645	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5529	2	3200	12.00	hybrid	0	0.00	hybrid	RIJA265	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5530	2	3200	12.00	hybrid	0	0.00	hybrid	RIJA26K4	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5531	2	3200	12.00	hybrid	0	0.00	hybrid	RIJA3703	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5532	2	3200	12.00	hybrid	0	0.00	hybrid	RIJA46	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5533	2	3200	12.00	hybrid	0	0.00	hybrid	RIJA529	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5534	2	3200	12.00	hybrid	0	0.00	hybrid	RIJA5290	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5535	2	3200	12.00	hybrid	0	0.00	hybrid	RIPPBP	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5536	2	3200	12.00	hybrid	0	0.00	hybrid	RIPPBPP	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5537	2	3200	12.00	hybrid	0	0.00	hybrid	RIPPGF	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5538	2	3200	12.00	hybrid	0	0.00	hybrid	RIPPMC	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5539	2	3200	12.00	hybrid	0	0.00	hybrid	RIPPNP	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5540	2	3200	12.00	hybrid	0	0.00	hybrid	RIPPWGN	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5541	2	3200	12.00	hybrid	0	0.00	hybrid	RIPPWGP	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5542	2	3200	12.00	hybrid	0	0.00	hybrid	RIPPWGS	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5543	2	3200	12.00	hybrid	0	0.00	hybrid	RMBDDMP	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5544	2	3200	12.00	hybrid	0	0.00	hybrid	RMBDGF	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5545	2	3200	12.00	hybrid	0	0.00	hybrid	RMBDMC	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5546	2	3200	12.00	hybrid	0	0.00	hybrid	RMBDMPC	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5547	2	3200	12.00	hybrid	0	0.00	hybrid	RMBDPMP	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5548	2	3200	12.00	hybrid	0	0.00	hybrid	RMGM1050	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5549	2	3200	12.00	hybrid	0	0.00	hybrid	RMGM1470	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5550	2	3200	12.00	hybrid	0	0.00	hybrid	RMGM2205	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5551	2	3200	12.00	hybrid	0	0.00	hybrid	RMGM3570	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5552	2	3200	12.00	hybrid	0	0.00	hybrid	RMGM368	t	t	2025-11-03 16:47:40.044167	2025-11-17 03:43:52.343028	f	0	\N	\N
5574	2	3200	12.00	hybrid	0	0.00	hybrid	SDDD1845	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5575	2	3200	12.00	hybrid	0	0.00	hybrid	SDDD282	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5576	2	3200	12.00	hybrid	0	0.00	hybrid	SDDD3134	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5577	2	3200	12.00	hybrid	0	0.00	hybrid	SDDD56	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5578	2	3200	12.00	hybrid	0	0.00	hybrid	SDDD579	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5579	2	3200	12.00	hybrid	0	0.00	hybrid	SDDD6279	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5580	2	3200	12.00	hybrid	0	0.00	hybrid	SERU10K	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5581	2	3200	12.00	hybrid	0	0.00	hybrid	SERU123	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5582	2	3200	12.00	hybrid	0	0.00	hybrid	SERU1300	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5583	2	3200	12.00	hybrid	0	0.00	hybrid	SERU13K6	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5584	2	3200	12.00	hybrid	0	0.00	hybrid	SERU1580	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5585	2	3200	12.00	hybrid	0	0.00	hybrid	SERU17K5	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5586	2	3200	12.00	hybrid	0	0.00	hybrid	SERU250	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5587	2	3200	12.00	hybrid	0	0.00	hybrid	SERU2650	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5588	2	3200	12.00	hybrid	0	0.00	hybrid	SERU310	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5589	2	3200	12.00	hybrid	0	0.00	hybrid	SERU3250	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5590	2	3200	12.00	hybrid	0	0.00	hybrid	SERU5375	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5591	2	3200	12.00	hybrid	0	0.00	hybrid	SERU775	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5592	2	3200	12.00	hybrid	0	0.00	hybrid	SLVO1	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5593	2	3200	12.00	hybrid	0	0.00	hybrid	SLVO100	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5594	2	3200	12.00	hybrid	0	0.00	hybrid	SLVO15	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5595	2	3200	12.00	hybrid	0	0.00	hybrid	SLVO30	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5596	2	3200	12.00	hybrid	0	0.00	hybrid	SLVO5	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5597	2	3200	12.00	hybrid	0	0.00	hybrid	SLVO50	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5598	2	3200	12.00	hybrid	0	0.00	hybrid	SMCN1378	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5599	2	3200	12.00	hybrid	0	0.00	hybrid	SMCN186	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5600	2	3200	12.00	hybrid	0	0.00	hybrid	SMCN2118	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5601	2	3200	12.00	hybrid	0	0.00	hybrid	SMCN318	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5602	2	3200	12.00	hybrid	0	0.00	hybrid	SMCN3548	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5603	2	3200	12.00	hybrid	0	0.00	hybrid	SMCN61	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5604	2	3200	12.00	hybrid	0	0.00	hybrid	SMCN686	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5605	2	3200	12.00	hybrid	0	0.00	hybrid	SMCN7108	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5606	2	3200	12.00	hybrid	0	0.00	hybrid	SSDD100	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5607	2	3200	12.00	hybrid	0	0.00	hybrid	SSDD10K	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5608	2	3200	12.00	hybrid	0	0.00	hybrid	SSDD1K	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5609	2	3200	12.00	hybrid	0	0.00	hybrid	SSDD20K	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5610	2	3200	12.00	hybrid	0	0.00	hybrid	SSDD2K	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5611	2	3200	12.00	hybrid	0	0.00	hybrid	SSDD500	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5612	2	3200	12.00	hybrid	0	0.00	hybrid	SSDD5K	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5613	2	3200	12.00	hybrid	0	0.00	hybrid	SUGS100	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5614	2	3200	12.00	hybrid	0	0.00	hybrid	SUGS1060	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5615	2	3200	12.00	hybrid	0	0.00	hybrid	SUGS2180	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5616	2	3200	12.00	hybrid	0	0.00	hybrid	SUGS310	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5617	2	3200	12.00	hybrid	0	0.00	hybrid	SUGS520	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5618	2	3200	12.00	hybrid	0	0.00	hybrid	SUGS5600	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5619	2	3200	12.00	hybrid	0	0.00	hybrid	SUPPMC	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5620	2	3200	12.00	hybrid	0	0.00	hybrid	SUPPPB	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5621	2	3200	12.00	hybrid	0	0.00	hybrid	SUPPSP	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5622	2	3200	12.00	hybrid	0	0.00	hybrid	SUPPVIP	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5623	2	3200	12.00	hybrid	0	0.00	hybrid	SUPPWC	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5624	2	3200	12.00	hybrid	0	0.00	hybrid	TACR1800	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5625	2	3200	12.00	hybrid	0	0.00	hybrid	TACR330	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5626	2	3200	12.00	hybrid	0	0.00	hybrid	TACR3600	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5627	2	3200	12.00	hybrid	0	0.00	hybrid	TACR60	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5628	2	3200	12.00	hybrid	0	0.00	hybrid	TACR700	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5629	2	3200	12.00	hybrid	0	0.00	hybrid	TACR7250	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5630	2	3200	12.00	hybrid	0	0.00	hybrid	TATI180D	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5631	2	3200	12.00	hybrid	0	0.00	hybrid	TATI30D	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5632	2	3200	12.00	hybrid	0	0.00	hybrid	TATI7D	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5633	2	3200	12.00	hybrid	0	0.00	hybrid	TJDD1200	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5634	2	3200	12.00	hybrid	0	0.00	hybrid	TJDD180	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5635	2	3200	12.00	hybrid	0	0.00	hybrid	TJDD1800	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5636	2	3200	12.00	hybrid	0	0.00	hybrid	TJDD300	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5637	2	3200	12.00	hybrid	0	0.00	hybrid	TJDD3000	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5638	2	3200	12.00	hybrid	0	0.00	hybrid	TJDD60	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5639	2	3200	12.00	hybrid	0	0.00	hybrid	TJDD600	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5640	2	3200	12.00	hybrid	0	0.00	hybrid	TJDD6000	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.343028	f	0	\N	\N
5641	2	3200	12.00	hybrid	0	0.00	hybrid	TLCK117	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5642	2	3200	12.00	hybrid	0	0.00	hybrid	TLCK1701	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5643	2	3200	12.00	hybrid	0	0.00	hybrid	TLCK279	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5644	2	3200	12.00	hybrid	0	0.00	hybrid	TLCK2826	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5645	2	3200	12.00	hybrid	0	0.00	hybrid	TLCK4248	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5646	2	3200	12.00	hybrid	0	0.00	hybrid	TLCK567	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5647	2	3200	12.00	hybrid	0	0.00	hybrid	TLCK846	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5648	2	3200	12.00	hybrid	0	0.00	hybrid	TLCK8487	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5649	2	3200	12.00	hybrid	0	0.00	hybrid	TLPPBB1	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5650	2	3200	12.00	hybrid	0	0.00	hybrid	TLPPBB2	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5651	2	3200	12.00	hybrid	0	0.00	hybrid	TLPPSP1	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5652	2	3200	12.00	hybrid	0	0.00	hybrid	TLPPSP2	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5653	2	3200	12.00	hybrid	0	0.00	hybrid	TRSY1200	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5654	2	3200	12.00	hybrid	0	0.00	hybrid	TRSY1800	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5655	2	3200	12.00	hybrid	0	0.00	hybrid	TRSY300	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5656	2	3200	12.00	hybrid	0	0.00	hybrid	TRSY3000	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5657	2	3200	12.00	hybrid	0	0.00	hybrid	TRSY60	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5658	2	3200	12.00	hybrid	0	0.00	hybrid	TRSY600	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5659	2	3200	12.00	hybrid	0	0.00	hybrid	TRSY6000	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5660	2	3200	12.00	hybrid	0	0.00	hybrid	TRSY900	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5665	2	3200	12.00	hybrid	0	0.00	hybrid	TTID575	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5666	2	3200	12.00	hybrid	0	0.00	hybrid	TTID6500	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5667	2	3200	12.00	hybrid	0	0.00	hybrid	TUAC100	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5668	2	3200	12.00	hybrid	0	0.00	hybrid	TUAC1000	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5669	2	3200	12.00	hybrid	0	0.00	hybrid	TUAC10K	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5670	2	3200	12.00	hybrid	0	0.00	hybrid	TUAC1500	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5671	2	3200	12.00	hybrid	0	0.00	hybrid	TUAC2000	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5672	2	3200	12.00	hybrid	0	0.00	hybrid	TUAC22	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5673	2	3200	12.00	hybrid	0	0.00	hybrid	TUAC2500	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5674	2	3200	12.00	hybrid	0	0.00	hybrid	TUAC3000	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5675	2	3200	12.00	hybrid	0	0.00	hybrid	TUAC500	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5676	2	3200	12.00	hybrid	0	0.00	hybrid	TUAC5000	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5677	2	3200	12.00	hybrid	0	0.00	hybrid	UDMMDE	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5678	2	3200	12.00	hybrid	0	0.00	hybrid	UDMMGPP	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5679	2	3200	12.00	hybrid	0	0.00	hybrid	UDMMKB	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5680	2	3200	12.00	hybrid	0	0.00	hybrid	UDMMKM	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5681	2	3200	12.00	hybrid	0	0.00	hybrid	UDRC1850	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5682	2	3200	12.00	hybrid	0	0.00	hybrid	UDRC250	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5683	2	3200	12.00	hybrid	0	0.00	hybrid	UDRC2800	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5684	2	3200	12.00	hybrid	0	0.00	hybrid	UDRC33000	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5685	2	3200	12.00	hybrid	0	0.00	hybrid	UDRC450	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5686	2	3200	12.00	hybrid	0	0.00	hybrid	UDRC4750	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5687	2	3200	12.00	hybrid	0	0.00	hybrid	UDRC66500	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5688	2	3200	12.00	hybrid	0	0.00	hybrid	UDRC80	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5689	2	3200	12.00	hybrid	0	0.00	hybrid	UDRC920	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5690	2	3200	12.00	hybrid	0	0.00	hybrid	UDRC9600	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5691	2	3200	12.00	hybrid	0	0.00	hybrid	WWLU1090	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5692	2	3200	12.00	hybrid	0	0.00	hybrid	WWLU2240	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5693	2	3200	12.00	hybrid	0	0.00	hybrid	WWLU330	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5694	2	3200	12.00	hybrid	0	0.00	hybrid	WWLU3880	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5695	2	3200	12.00	hybrid	0	0.00	hybrid	WWLU60	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5696	2	3200	12.00	hybrid	0	0.00	hybrid	WWLU8080	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5697	2	3200	12.00	hybrid	0	0.00	hybrid	ZPCC10K2	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5698	2	3200	12.00	hybrid	0	0.00	hybrid	ZPCC110K	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5699	2	3200	12.00	hybrid	0	0.00	hybrid	ZPCC21K	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5700	2	3200	12.00	hybrid	0	0.00	hybrid	ZPCC234K	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5701	2	3200	12.00	hybrid	0	0.00	hybrid	ZPCC25K2	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5702	2	3200	12.00	hybrid	0	0.00	hybrid	ZPCC300K	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5703	2	3200	12.00	hybrid	0	0.00	hybrid	ZPCC38K9	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5704	2	3200	12.00	hybrid	0	0.00	hybrid	ZPCC40K7	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5705	2	3200	12.00	hybrid	0	0.00	hybrid	ZPCC4680	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5706	2	3200	12.00	hybrid	0	0.00	hybrid	ZPCC62K8	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5707	2	3200	12.00	hybrid	0	0.00	hybrid	ZPCC9700	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5708	2	3200	12.00	hybrid	0	0.00	hybrid	ZPZM1000	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5709	2	3200	12.00	hybrid	0	0.00	hybrid	ZPZM125	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5710	2	3200	12.00	hybrid	0	0.00	hybrid	ZPZM128	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5711	2	3200	12.00	hybrid	0	0.00	hybrid	ZPZM14	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5712	2	3200	12.00	hybrid	0	0.00	hybrid	ZPZM196	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5713	2	3200	12.00	hybrid	0	0.00	hybrid	ZPZM28	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5714	2	3200	12.00	hybrid	0	0.00	hybrid	ZPZM323	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5715	2	3200	12.00	hybrid	0	0.00	hybrid	ZPZM58	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5716	2	3200	12.00	hybrid	0	0.00	hybrid	ZPZM770	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5717	2	3200	12.00	hybrid	0	0.00	hybrid	ZZIKIK1	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5718	2	3200	12.00	hybrid	0	0.00	hybrid	ZZIKIK2	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5719	2	3200	12.00	hybrid	0	0.00	hybrid	ZZIKIK3	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5720	2	3200	12.00	hybrid	0	0.00	hybrid	ZZIKIK4	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5721	2	3200	12.00	hybrid	0	0.00	hybrid	ZZIKIK5	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5722	2	3200	12.00	hybrid	0	0.00	hybrid	ZZMC1980	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5723	2	3200	12.00	hybrid	0	0.00	hybrid	ZZMC300	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5724	2	3200	12.00	hybrid	0	0.00	hybrid	ZZMC3280	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5725	2	3200	12.00	hybrid	0	0.00	hybrid	ZZMC60	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5726	2	3200	12.00	hybrid	0	0.00	hybrid	ZZMC6480	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5727	2	3200	12.00	hybrid	0	0.00	hybrid	ZZMC6480X2	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5728	2	3200	12.00	hybrid	0	0.00	hybrid	ZZMC6480X3	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5729	2	3200	12.00	hybrid	0	0.00	hybrid	ZZMC6480X4	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5730	2	3200	12.00	hybrid	0	0.00	hybrid	ZZMC6480X5	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5731	2	3200	12.00	hybrid	0	0.00	hybrid	ZZMC980	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5732	2	3200	12.00	hybrid	0	0.00	hybrid	ZZMCALL	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5733	2	3200	12.00	hybrid	0	0.00	hybrid	BLVV100	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5734	2	3200	12.00	hybrid	0	0.00	hybrid	BLVV1000	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5735	2	3200	12.00	hybrid	0	0.00	hybrid	BLVV150	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5736	2	3200	12.00	hybrid	0	0.00	hybrid	BLVV200	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5737	2	3200	12.00	hybrid	0	0.00	hybrid	BLVV2000	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5738	2	3200	12.00	hybrid	0	0.00	hybrid	BLVV25	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5739	2	3200	12.00	hybrid	0	0.00	hybrid	BLVV250	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5740	2	3200	12.00	hybrid	0	0.00	hybrid	BLVV300	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5741	2	3200	12.00	hybrid	0	0.00	hybrid	BLVV3000	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5742	2	3200	12.00	hybrid	0	0.00	hybrid	BLVV4000	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5743	2	3200	12.00	hybrid	0	0.00	hybrid	BLVV50	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5744	2	3200	12.00	hybrid	0	0.00	hybrid	BLVV500	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5745	2	3200	12.00	hybrid	0	0.00	hybrid	BLVV750	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5746	2	3200	12.00	hybrid	0	0.00	hybrid	BNGC10	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5747	2	3200	12.00	hybrid	0	0.00	hybrid	BNGC20	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5748	2	3200	12.00	hybrid	0	0.00	hybrid	BNGC5	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5749	2	3200	12.00	hybrid	0	0.00	hybrid	BNGC50	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5750	2	3200	12.00	hybrid	0	0.00	hybrid	BZIDR150	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5751	2	3200	12.00	hybrid	0	0.00	hybrid	BZIDR300	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5752	2	3200	12.00	hybrid	0	0.00	hybrid	BZIDR75	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5753	2	3200	12.00	hybrid	0	0.00	hybrid	BZUSD10	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5754	2	3200	12.00	hybrid	0	0.00	hybrid	BZUSD20	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5755	2	3200	12.00	hybrid	0	0.00	hybrid	BZUSD5	t	t	2025-11-03 16:47:40.169121	2025-11-17 03:43:52.456355	f	0	\N	\N
5756	2	3200	12.00	hybrid	0	0.00	hybrid	CCCC10	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5757	2	3200	12.00	hybrid	0	0.00	hybrid	CCCC100	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5758	2	3200	12.00	hybrid	0	0.00	hybrid	CCCC30	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5759	2	3200	12.00	hybrid	0	0.00	hybrid	CCCC5	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5760	2	3200	12.00	hybrid	0	0.00	hybrid	CCCC50	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5761	2	3200	12.00	hybrid	0	0.00	hybrid	CFEC100	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5762	2	3200	12.00	hybrid	0	0.00	hybrid	CFEC1000	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5763	2	3200	12.00	hybrid	0	0.00	hybrid	CFEC20	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5764	2	3200	12.00	hybrid	0	0.00	hybrid	CFEC200	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5765	2	3200	12.00	hybrid	0	0.00	hybrid	CFEC300	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5766	2	3200	12.00	hybrid	0	0.00	hybrid	CFEC400	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5767	2	3200	12.00	hybrid	0	0.00	hybrid	CFEC50	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5768	2	3200	12.00	hybrid	0	0.00	hybrid	CFEC500	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5769	2	3200	12.00	hybrid	0	0.00	hybrid	GNPP12	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5770	2	3200	12.00	hybrid	0	0.00	hybrid	GNPP3	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5771	2	3200	12.00	hybrid	0	0.00	hybrid	GNPP30L	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5772	2	3200	12.00	hybrid	0	0.00	hybrid	GNPP30P	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5773	2	3200	12.00	hybrid	0	0.00	hybrid	GNPP30PP	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5774	2	3200	12.00	hybrid	0	0.00	hybrid	GNPP6	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5775	2	3200	12.00	hybrid	0	0.00	hybrid	GPIDR10	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5776	2	3200	12.00	hybrid	0	0.00	hybrid	GPIDR100	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5777	2	3200	12.00	hybrid	0	0.00	hybrid	GPIDR150	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5778	2	3200	12.00	hybrid	0	0.00	hybrid	GPIDR20	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5779	2	3200	12.00	hybrid	0	0.00	hybrid	GPIDR300	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5780	2	3200	12.00	hybrid	0	0.00	hybrid	GPIDR35	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5781	2	3200	12.00	hybrid	0	0.00	hybrid	GPIDR5	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5782	2	3200	12.00	hybrid	0	0.00	hybrid	GPIDR50	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5783	2	3200	12.00	hybrid	0	0.00	hybrid	GPIDR500	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5784	2	3200	12.00	hybrid	0	0.00	hybrid	GSVID165	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5785	2	3200	12.00	hybrid	0	0.00	hybrid	GSVID33	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5786	2	3200	12.00	hybrid	0	0.00	hybrid	GSVID330	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5787	2	3200	12.00	hybrid	0	0.00	hybrid	GSVID66	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5788	2	3200	12.00	hybrid	0	0.00	hybrid	GSVPH1K	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5789	2	3200	12.00	hybrid	0	0.00	hybrid	IQBA1	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5790	2	3200	12.00	hybrid	0	0.00	hybrid	IQBA14	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5791	2	3200	12.00	hybrid	0	0.00	hybrid	IQBA180	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5792	2	3200	12.00	hybrid	0	0.00	hybrid	IQBA3	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5793	2	3200	12.00	hybrid	0	0.00	hybrid	IQBA30	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5794	2	3200	12.00	hybrid	0	0.00	hybrid	IQBA365	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5795	2	3200	12.00	hybrid	0	0.00	hybrid	IQBA7	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5796	2	3200	12.00	hybrid	0	0.00	hybrid	IQBA90	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5797	2	3200	12.00	hybrid	0	0.00	hybrid	IQST1	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5798	2	3200	12.00	hybrid	0	0.00	hybrid	IQST14	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5799	2	3200	12.00	hybrid	0	0.00	hybrid	IQST180	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5800	2	3200	12.00	hybrid	0	0.00	hybrid	IQST3	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5801	2	3200	12.00	hybrid	0	0.00	hybrid	IQST30	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5802	2	3200	12.00	hybrid	0	0.00	hybrid	IQST365	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5803	2	3200	12.00	hybrid	0	0.00	hybrid	IQST7	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5804	2	3200	12.00	hybrid	0	0.00	hybrid	IQST90	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5805	2	3200	12.00	hybrid	0	0.00	hybrid	NNUSD10	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5806	2	3200	12.00	hybrid	0	0.00	hybrid	NNUSD20	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5807	2	3200	12.00	hybrid	0	0.00	hybrid	NNUSD35	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5808	2	3200	12.00	hybrid	0	0.00	hybrid	NNUSD50	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5809	2	3200	12.00	hybrid	0	0.00	hybrid	NPGUS1	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5810	2	3200	12.00	hybrid	0	0.00	hybrid	NPGUS10	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5811	2	3200	12.00	hybrid	0	0.00	hybrid	NPGUS100	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5812	2	3200	12.00	hybrid	0	0.00	hybrid	NPGUS15	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5813	2	3200	12.00	hybrid	0	0.00	hybrid	NPGUS20	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5814	2	3200	12.00	hybrid	0	0.00	hybrid	NPGUS25	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5815	2	3200	12.00	hybrid	0	0.00	hybrid	NPGUS5	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5816	2	3200	12.00	hybrid	0	0.00	hybrid	NPGUS50	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5817	2	3200	12.00	hybrid	0	0.00	hybrid	PGVV1800	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5818	2	3200	12.00	hybrid	0	0.00	hybrid	PGVV325	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5819	2	3200	12.00	hybrid	0	0.00	hybrid	PGVV3850	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5820	2	3200	12.00	hybrid	0	0.00	hybrid	PGVV60	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5821	2	3200	12.00	hybrid	0	0.00	hybrid	PGVV660	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5822	2	3200	12.00	hybrid	0	0.00	hybrid	PGVV8100	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5823	2	3200	12.00	hybrid	0	0.00	hybrid	PSIDR100	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5824	2	3200	12.00	hybrid	0	0.00	hybrid	PSIDR1JT	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5825	2	3200	12.00	hybrid	0	0.00	hybrid	PSIDR1JT5	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5826	2	3200	12.00	hybrid	0	0.00	hybrid	PSIDR200	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5827	2	3200	12.00	hybrid	0	0.00	hybrid	PSIDR300	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5828	2	3200	12.00	hybrid	0	0.00	hybrid	PSIDR600	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5829	2	3200	12.00	hybrid	0	0.00	hybrid	PVVC1200	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5830	2	3200	12.00	hybrid	0	0.00	hybrid	PVVC12000	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5831	2	3200	12.00	hybrid	0	0.00	hybrid	PVVC2400	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5832	2	3200	12.00	hybrid	0	0.00	hybrid	PVVC24000	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5833	2	3200	12.00	hybrid	0	0.00	hybrid	PVVC36000	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5834	2	3200	12.00	hybrid	0	0.00	hybrid	PVVC6000	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5835	2	3200	12.00	hybrid	0	0.00	hybrid	PVVC60000	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5836	2	3200	12.00	hybrid	0	0.00	hybrid	RBIDR100	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5837	2	3200	12.00	hybrid	0	0.00	hybrid	RBIDR300	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5838	2	3200	12.00	hybrid	0	0.00	hybrid	RBIDR50	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5839	2	3200	12.00	hybrid	0	0.00	hybrid	RBIDR500	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5840	2	3200	12.00	hybrid	0	0.00	hybrid	RBIDR65	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.456355	f	0	\N	\N
5841	2	3200	12.00	hybrid	0	0.00	hybrid	RBRB100	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5842	2	3200	12.00	hybrid	0	0.00	hybrid	RBRB200	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5843	2	3200	12.00	hybrid	0	0.00	hybrid	RBRB800	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5844	2	3200	12.00	hybrid	0	0.00	hybrid	RGIDR10	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5845	2	3200	12.00	hybrid	0	0.00	hybrid	RGIDR100	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5846	2	3200	12.00	hybrid	0	0.00	hybrid	RGIDR1JT	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5847	2	3200	12.00	hybrid	0	0.00	hybrid	RGIDR20	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5848	2	3200	12.00	hybrid	0	0.00	hybrid	RGIDR200	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5849	2	3200	12.00	hybrid	0	0.00	hybrid	RGIDR50	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5850	2	3200	12.00	hybrid	0	0.00	hybrid	RGIDR500	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5851	2	3200	12.00	hybrid	0	0.00	hybrid	RGPHP100	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5852	2	3200	12.00	hybrid	0	0.00	hybrid	RGPHP1000	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5853	2	3200	12.00	hybrid	0	0.00	hybrid	RGPHP150	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5854	2	3200	12.00	hybrid	0	0.00	hybrid	RGPHP20	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5855	2	3200	12.00	hybrid	0	0.00	hybrid	RGPHP2000	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5867	2	3200	12.00	hybrid	0	0.00	hybrid	SVIDR60	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5868	2	3200	12.00	hybrid	0	0.00	hybrid	SVIDR600	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5869	2	3200	12.00	hybrid	0	0.00	hybrid	SVIDR8	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5870	2	3200	12.00	hybrid	0	0.00	hybrid	SVIDR90	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5871	2	3200	12.00	hybrid	0	0.00	hybrid	TCIDR2040	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5872	2	3200	12.00	hybrid	0	0.00	hybrid	TCIDR210	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5873	2	3200	12.00	hybrid	0	0.00	hybrid	TCIDR400	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5874	2	3200	12.00	hybrid	0	0.00	hybrid	TCIDR4100	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5875	2	3200	12.00	hybrid	0	0.00	hybrid	TCIDR80	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5876	2	3200	12.00	hybrid	0	0.00	hybrid	TCIDR800	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5877	2	3200	12.00	hybrid	0	0.00	hybrid	XBMU1	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5878	2	3200	12.00	hybrid	0	0.00	hybrid	XBMU3	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5879	2	3200	12.00	hybrid	0	0.00	hybrid	XBUSD10	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
5880	2	3200	12.00	hybrid	0	0.00	hybrid	XBUSD15	t	t	2025-11-03 16:47:40.295327	2025-11-17 03:43:52.566879	f	0	\N	\N
7122	2	3200	12.00	hybrid	0	0.00	hybrid	ACTO1180	t	t	2025-11-17 03:41:40.031397	2025-11-17 03:43:52.566879	f	0	\N	\N
7123	2	3200	12.00	hybrid	0	0.00	hybrid	ACTO250	t	t	2025-11-17 03:41:40.031397	2025-11-17 03:43:52.566879	f	0	\N	\N
7124	2	3200	12.00	hybrid	0	0.00	hybrid	ACTO2880	t	t	2025-11-17 03:41:40.031397	2025-11-17 03:43:52.566879	f	0	\N	\N
7125	2	3200	12.00	hybrid	0	0.00	hybrid	ACTO5880	t	t	2025-11-17 03:41:40.031397	2025-11-17 03:43:52.566879	f	0	\N	\N
7126	2	3200	12.00	hybrid	0	0.00	hybrid	ACTO60	t	t	2025-11-17 03:41:40.031397	2025-11-17 03:43:52.566879	f	0	\N	\N
7127	2	3200	12.00	hybrid	0	0.00	hybrid	ACTO680	t	t	2025-11-17 03:41:40.031397	2025-11-17 03:43:52.566879	f	0	\N	\N
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.reviews (id, name, phone_number, content_type, email, stars, content, created_at, branch_id) FROM stdin;
1	MOH WAFIUDDIN WAFIQ	082226197047	input	wafiq610@gmail.com	5	Bagus Okeee	2025-10-06 03:45:03.048852+00	5
2	MOH WAFIUDDIN WAFIQ	082226197047	input	wafiq610@gmail.com	5	Oke Sekaliii ya kamuuu\n	2025-10-06 03:45:33.607655+00	5
3	MOH WAFIUDDIN WAFIQ	082226197047	input	wafiq610@gmail.com	5	Alhamdulillah Memuaskan	2025-10-10 08:57:49.273627+00	1
4	Ragil		input		5	Mantappp	2025-11-16 06:58:58.79754+00	1
5			input		0		2025-11-17 08:58:02.246141+00	1
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.roles (id, name, description, is_deleted, is_active, created_at, updated_at) FROM stdin;
1	admin	admin	f	t	2025-09-13 23:37:20.252171	2025-09-13 23:37:20.252171
3	Member	Member	t	t	2025-09-23 03:18:52.638482	2025-09-23 03:18:52.638482
2	reseller	reseller	f	t	2025-09-13 23:37:31.811689	2025-09-13 23:37:31.811689
4	MemberKw	MemberKw	t	f	2025-09-23 04:35:27.49018	2025-09-23 04:35:27.49018
\.


--
-- Data for Name: sub_categories; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.sub_categories (code, name, category_brand, is_active, region, image) FROM stdin;
MLGLOB	Region Global	MOBILE LEGENDS	t	\N	\N
MLFT	First Topup	MOBILE LEGENDS	t	\N	\N
MLBR	Region Brazil	MOBILE LEGENDS	t	Brazil	\N
MLPH	Region Philippines	MOBILE LEGENDS	t	Philiphines	\N
MLRU	Region Rusia	MOBILE LEGENDS	t	Rusia	\N
RBL	Robux	Roblox	t	\N	\N
RBLID	Gift Card IDR	Roblox	t	\N	\N
RBLUS	Gift Card USD	Roblox	t	\N	\N
STMG	Gems	Stumble Guys	t	\N	\N
GICN	Chronal Nexus	Genshin Impact	t		
MLMS	Weekly Diamonds Point	MOBILE LEGENDS	t	\N	\N
MLID	Region Indonesia	MOBILE LEGENDS	t	Indonesia	https://res.cloudinary.com/dikf91ikq/image/upload/v1761208908/uploads/uploads/c899cd64-bfde-430f-ad34-8f28ae241558.webp
AFDC	Dragon Crystals	AFK JOURNEY	t		
AFEM	Esperia Monthly	AFK JOURNEY	t		
AFGB	Growth Bundle	AFK JOURNEY	t		
AUDM	Diamonds	AU2 Mobile	t		
HGDS	Diamonds	Hago	t		
AKRBB	Rubi	ASTRA: Knights of Veda	t		
LMDO	Diamonds	Legend of Mushroom Rush	t		
AOV	Vouchers	Arena of Valor	t	\N	\N
CDTO	Tokens	Dunk City Dynasty	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979978/uploads/uploads/icon-dunk-city-dynasty_2_30px.webp
MBPP	Packages	MOB RUSH	t		
HPJW	Jewels	Harry Potter Magic Awakening	t		
HKTO	Tokens	Honor Of Kings	t		
HKCD	Card	Honor Of Kings	t		
CTGB	Golden Ball	Captain Tsubasa Ace	t		
GWMS	Membership	GROWTOPIA	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762980237/uploads/uploads/icon-growtopia_4_30px.webp
PUAG	AeosGems	Pokémon Unite	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979268/uploads/uploads/icon-pokemon-unite_1_30px.webp
IVEC	Echoes	Identity V	t		
IVPC	Packages	Identity V	t		
KCDM	Diamonds	Kings Choice	t		
KCPC	Packages	Kings Choice	t		
LECO	Coins	Land of Empires	t		
LLPH	Region PH	League of Legends Wild Rift	t	Philippines	
LLID	Region ID	League of Legends Wild Rift	t	Indonesia	
LLMY	Region MY	League of Legends Wild Rift	t	Malaysia	
LFTO	Tokens	Legacy Fate Sacred and Fearless	t		
LRID	Region ID	Legends of Runeterra	t	Indonesia	
LRMY	Region MY	Legends of Runeterra	t	Malaysia	
LRPH	Region PH	Legends of Runeterra	t	Philippines	
LACR	Credits	LifeAfter	t		
LTCY	Crystals	Light of Thel New Era	t		
L2DM	Diamonds	Lineage2M	t		
L2PC	Packages	Lineage2M	t		
LMDM	Diamonds	Lords Mobile	t		
LDCR	Crystals	Love and Deepspace	t		
LDPP	Packages	Love and Deepspace	t		
LBDO	Diamonds	Lovebrush Chronicles	t		
LBPG	Packages	Lovebrush Chronicles	t		
MCIDD	Diamonds	Magic Chess Go Go	t		
MCIDW	Weekly Card	Magic Chess Go Go	t		
MCIDF	First Top Up	Magic Chess Go Go	t		
MDSD	Stardust	MARVEL Duel	t		
MAID	Region ID	METAL SLUG AWAKENING	t	Indonesia	
MAMY	Region MY	METAL SLUG AWAKENING	t	Malaysia	
MAPH	Region PH	METAL SLUG AWAKENING	t	Philippines	
MAPP	Packages	METAL SLUG AWAKENING	t		
MLNS	Region Non Sea	MOBILE LEGENDS	t	Non Sea	
MDTP	Token Pack	MU New Dawn	t		
MDPP	Packages	MU New Dawn	t		
M2BD	Badges	MU Origin 2	t		
M2DD	Diamonds	MU Origin 2	t		
M3DD	Divine Diamonds	MU Origin 3	t		
MAGB	Glory Badges	MU Devils Awaken	t		
MADD	Diamonds	MU Devils Awaken	t		
NIIC	IC	NBA INFINITE	t		
NSNC	NC	PUBG New State Mobile	t		
OHCG	Crystgin	Once Human	t		
OHPP	Packages	Once Human	t		
OPKP	Kupon	ONE PUNCH MAN The Strongest	t		
OAJA	Jade	Onmyoji Arena	t		
PNUC	Ultracubes	Path to Nowhere	t		
PNPP	Packages	Path to Nowhere	t		
PGPP	Packages	Pixel Gun 3D	t		
PGCO	Coins	Pixel Gun 3D	t		
PGGG	Gems	Pixel Gun 3D	t		
PGKY	Keys	Pixel Gun 3D	t		
PBUC	Region ID	PUBG Mobile	t	Indonesia	
AEEC	Empire Coins	Age of Empires Mobile	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979468/uploads/uploads/icon-age-of-empires-mobile_8_30px.webp
CDID	Region ID	Call of Duty Mobile	t	Indonesia	https://res.cloudinary.com/dikf91ikq/image/upload/v1762979627/uploads/uploads/icon-call-of-duty-mobile_1_30px.webp
CCGL	Golds	Command & Conquer	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979700/uploads/uploads/icon-command-and-conquertm-legions_2_30px.webp
CAVO	Vouchers	Crystal of Atlan	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979799/uploads/uploads/icon-crystal-of-atlan_5_30px.webp
EPCO	Coins	EGGY PARTY	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762980088/uploads/uploads/icon-eggy-party_15.webp
FFID	Region Indonesia	FREE FIRE	t	-	https://res.cloudinary.com/dikf91ikq/image/upload/v1762980146/uploads/uploads/icon-free-fire-global_3_30px.webp
FFGLOB	Region Global	FREE FIRE	t	- 	https://res.cloudinary.com/dikf91ikq/image/upload/v1762980146/uploads/uploads/icon-free-fire-global_3_30px.webp
GVGM	Gems	Goddess of Victory Nikke	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1763007441/uploads/uploads/icon-goddess-of-victory-nikke_1.webp
HFRC	Recruit	HAIKYU FLY HIGH	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1763007521/uploads/uploads/icon-haikyu-fly-high-garena_22.webp
HUGM	Gems	Heroic Uncle Kim	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1763007650/uploads/uploads/icon-honkai-impact-3_8.webp
HSPG	Packages	Honkai Star Rail	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1763007769/uploads/uploads/icon-honkai-star-rail_1.webp
PBGlob	Region Global	PUBG Mobile	t	Global	
PBPS	PASS	PUBG Mobile	t		
PGEA	Android	Punishing Gray Raven	t		
PGEI	iOS	Punishing Gray Raven	t		
RMGM	Gens	Racing Master	t		
RMBD	Bundle	Racing Master	t		
RCZN	Zeny	Ragnarok M Classic	t		
RCML	Monthly	Ragnarok M Classic	t		
RCKA	Kafra Adventure	Ragnarok M Classic	t		
REPP	Packages	Ragnarok M Eternal Love	t		
REBCC	Big Cat Coins	Ragnarok M Eternal Love	t		
RONB	Nyan berry	Ragnarok Origin	t		
RONP	Nyan Pass	Ragnarok Origin	t		
RNPP	Packages	Ragnarok X Next Generation	t		
RNDM	Diamons	Ragnarok X Next Generation	t		
RIJA	Jade	Revelation Infinite Journey	t		
RIPP	Packages	Revelation Infinite Journey	t		
SMCN	Candies	Sausage Man	t		
SERU	Ruby	SEAL M SEA	t		
SCBG	Bit Gold	Snowbreak Containment Zone	t		
SLVO	Vouchers	Soul Land New World	t		
SDDD	Diamonds	Speed Drifters	t		
SSDD	Diamonds	State of Survival Zombie War	t		
SUPP	Packages	Super SUS	t		
SUGS	Goldstart	Super SUS	t		
TRSY	Sycee	Tamashi Rise of Yokai	t		
TATI	Ticket	Tarisland	t		
TACR	Crystals	Tarisland	t		
TTID	Region ID	Teamfight Tactics Mobile	t	Indonesia	
TTMY	Region MY	Teamfight Tactics Mobile	t	Malaysia	
TTPH	Region PH	Teamfight Tactics Mobile	t	Philippines	
TLCK	Crystals	The Legend of Neverland	t		
TLPP	Packages	The Legend of Neverland	t		
TJDD	Diamonds	Tom and Jerry Chase	t		
UDMM	Membership	UNDAWN	t		
UDRC	RC	UNDAWN	t		
WWLU	Lunites	Wuthering Waves	t		
ZZIK	Inter-Knot	Zenless Zone Zero	t		
ZZMC	Monochrome	Zenless Zone Zero	t		
ZPCC	Coins	Zepeto	t		
ZPZM	Zems	Zepeto	t		
ABVV	Vouchers	Arena Breakout	t		
BNGC	Gift Card	Battlenet	t		
BLVV	Vouchers	Bigo Live	t		
BZIDR	Gift Card IDR	Blizzard 	t	Indonesia	
BZUSD	Gift Card USD	Blizzard 	t	US	
BSPMY	Premium Malaysia	Bstation	t	Malaysia	
BSPID	Premium Indonesia	Bstation	t	Indonesia	
CCCC	Credits	Cherry Credits	t		
CFEC	Ecoins	Crossfire	t		
DCNN	NITRO	Discord	t		
GSVID	Shell Region ID	Garena Shell	t	Indonesia	
GSVPH	Shell Region PH	Garena Shell	t	Philippines	
GNPP	Packages	GeForce NOW	t		
GPIDR	IDR	Google Play	t	Indonesia	
IQBA	Basic	IQIYI	t		
IQST	Standard	IQIYI	t		
ISQP	Premium	IQIYI	t		
NPGUS	Gift Card USD	Netease Pay	t	US	
NNUSD	Vouchers USD	Nintendo Eshop	t		
PVVC	Voucher Cash	Point Blank	t		
PSIDR	Voucher IDR (Indonesia Only)	Play Station PSN	t		
PSRM	Voucher RM (Malaysia Only)	Play Station PSN	t		
PSUSD	Voucher USD (US Only)	Play Station PSN	t		
PGVV	Voucher	PUBG Voucher	t		
RGIDR	PIN IDR	Razer Gold	t	Indonesia	
RGPHP	PIN PHP	Razer Gold	t	Philippines	
RBIDR	Gift Card IDR	Roblox	t		
RBRBX	Robux	Roblox	t		
SVIDR	Voucher IDR	Steam	t	Indonesia	
SVRM	Voucher RM	Steam	t	Malaysia	
TCIDR	Gift Card IDR	TikTok Coin	t		
VIVOP	Platinum	Vidio	t		
VIVOD	Diamond	Vidio	t		
VIVOU	Ultimate	Vidio	t		
VIUVP	Voucher Premium	VIU Premium	t		
XBUSD	Voucher USD	XBOX	t	US	
XBMUSD	Voucher Membership USD	XBOX	t		
CAPP	Packages	Crystal of Atlan	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979810/uploads/uploads/icon-crystal-of-atlan_1_30px.webp
ACTO	Tokens	ACE RACER	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762977305/uploads/uploads/icon-ace-racer_1.webp
TUAC	AntCoin	The Ants Underground Kingdom	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979305/uploads/uploads/icon-the-ants-underground-kingdom_1_30px.webp
AEAC	Apex Coins	Age of Empires Mobile	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979328/uploads/uploads/icon-age-of-empires-mobile_2_30px.webp
ABBB	Bonds	AB Mobile	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979377/uploads/uploads/icon-arena-breakout_7_30px.webp
ABPG	Packages	AB Mobile	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979390/uploads/uploads/icon-arena-breakout_2_30px.webp
BSPS	Pass	Blood Strike	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979550/uploads/uploads/icon-blood-strike_7_30px.webp
BSGL	Gold	Blood Strike	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979587/uploads/uploads/icon-blood-strike_8_30px.webp
CIWP	Wallet Points	Cabal Infinite Combo	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979612/uploads/uploads/icon-cabal-infinite-combo-sea_1_30px.webp
CDSG	Region SG	Call of Duty Mobile	t	Singapura	https://res.cloudinary.com/dikf91ikq/image/upload/v1762979627/uploads/uploads/icon-call-of-duty-mobile_1_30px.webp
CAOP	Opals	Crystal of Atlan	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979765/uploads/uploads/icon-crystal-of-atlan_11_30px.webp
DCCP	Cash Pack	Dragon Nest M Classic	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979841/uploads/uploads/icon-dragon-nest-m-classic_1_30px.webp
CDPP	Premium Packages	Dunk City Dynasty	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762979969/uploads/uploads/icon-dunk-city-dynasty_9_30px.webp
DHVO	Vouchers	Dynasty Heroes Samkok Legend	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762980001/uploads/uploads/icon-dynasty-heroes-samkok-legend_1_30px.webp
FMSVR	Silver	FC Mobile	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762980109/uploads/uploads/icon-fc-mobile_8_30px.webp
FMFCP	FC Points	FC Mobile	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762980118/uploads/uploads/icon-fc-mobile_1_30px.webp
FFLU	Level Up	FREE FIRE	t	-	https://res.cloudinary.com/dikf91ikq/image/upload/v1762980146/uploads/uploads/icon-free-fire-global_3_30px.webp
FFMS	Membership	FREE FIRE	t	-	https://res.cloudinary.com/dikf91ikq/image/upload/v1762980174/uploads/uploads/icon-free-fire-global_2_30px.webp
FFSG	Region SG	FREE FIRE	t	-	https://res.cloudinary.com/dikf91ikq/image/upload/v1762980146/uploads/uploads/icon-free-fire-global_3_30px.webp
FFMY	Region MY	FREE FIRE	t	-	https://res.cloudinary.com/dikf91ikq/image/upload/v1762980146/uploads/uploads/icon-free-fire-global_3_30px.webp
GICR	Crystals	Genshin Impact	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1762980303/uploads/uploads/icon-genshin-impact_6_30px.webp
GIBS	Blessings	Genshin Impact	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1763007403/uploads/uploads/icon-genshin-impact_1.webp
HFSG	Star Gems	HAIKYU FLY HIGH	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1763007462/uploads/uploads/icon-haikyu-fly-high-garena_1.webp
HFPC	Pack	HAIKYU FLY HIGH	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1763007512/uploads/uploads/icon-haikyu-fly-high-garena_10.webp
HBPQ	Paid Quartz	Heaven Burns Red	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1763007584/uploads/uploads/icon-heaven-burns-red_7_30px.webp
HICR	Crystals	Honkai Impact 3	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1763007642/uploads/uploads/icon-honkai-impact-3_2.webp
HIBC	B-Chips	Honkai Impact 3	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1763007650/uploads/uploads/icon-honkai-impact-3_8.webp
HISI	Special Items	Honkai Impact 3	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1763007689/uploads/uploads/icon-honkai-impact-3_2_30px.webp
HSOS	Oneiric Shard	Honkai Star Rail	t		https://res.cloudinary.com/dikf91ikq/image/upload/v1763007779/uploads/uploads/icon-honkai-star-rail_3_30px.webp
\.


--
-- Data for Name: transaction_check_nickname; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.transaction_check_nickname (id, ref_id, game, nickname, response, created_at, updated_at, region, status, trx_id, tujuan) FROM stdin;
210	13960073027067086	mobile legends	GIKS	\N	2025-11-10 04:50:25.215282	2025-11-10 04:50:25.215282	Indonesia	success	171	1396007302706
212	1427866019159386247	mobile legends	ReyKatsuraa.	\N	2025-11-10 21:15:08.19785	2025-11-10 21:15:08.19785	Indonesia	success	178	142786601915938
214	104006632728591	free fire	alkenzi.amir	\N	2025-11-12 13:35:43.590148	2025-11-12 13:35:43.590148	-	success	180	10400663272
216	81002594938os_asia0646	zenless zone zero	\N	\N	2025-11-12 13:41:46.140906	2025-11-12 13:41:46.140906	\N	failed	182	81002594938os_asia
218	13960073027056709	mobile legends	\N	\N	2025-11-13 06:59:10.478064	2025-11-13 06:59:10.478064	\N	failed	184	1396007302705
220	115519501159669	free fire	KIWOGBSK	\N	2025-11-13 18:26:17.542628	2025-11-13 18:26:17.542628	-	success	186	11551950115
\.


--
-- Data for Name: transaction_reseller; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.transaction_reseller (id, branch_id, reference_id, product_code, user_id, tujuan, price, purchase_price, fee, laba, total, status, note, payment_code, payment_payload, created_at, updated_at, serial_number, phone_number, trx_id, product_name, email, note_fee, discount) FROM stdin;
1	5	RS01760290785870976770	VML5	0	1396007302706	11608	11608	1023.00	0.00	12631	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540812631.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ3T46K5B02120819190858480309ZILOGGAME0520NQ6121_0_193547E40990703A0163046692","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25WF3JHJE7CGZ34LS","amount":"12631","reference":"D20336254CJKBE2LMGTF7RO","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540812631.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ3T46K5B02120819190858480309ZILOGGAME0520NQ6121_0_193547E40990703A0163046692	2025-10-12 17:39:45.757066	2025-10-13 00:39:48.378662	\N	82226197047	\N	Top Up 5 Diamond	wafiq610@gmail.com	fee default : 11608	0
30	6	RS281761744431638560952	MLID3	28	1396007302706	4309	4309	4243.00	0.00	8552	failed	Alamat IP tidak sesuai	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJQNXHLK702120819190858480309ZILOGGAME0520NQ6121_0_8979BE800BD0703A016304B7B5	2025-10-29 13:27:11.432074	2025-10-29 13:28:19.281071	\N	82226197047		3 Diamond	wafiq610@gmail.com	fee default : 4309	0
2	5	RS141760328806584401400	VML3	14	1396007302706	11106	11106	77.00	0.00	11183	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540811183.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ5U7TKHL02120819190858480309ZILOGGAME0520NQ6121_0_226CBE6A27B0703A016304FB4A","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25GEFAC57JDPM40RA","amount":"11183","reference":"D2033625Y461M56XEGX53G6","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540811183.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ5U7TKHL02120819190858480309ZILOGGAME0520NQ6121_0_226CBE6A27B0703A016304FB4A	2025-10-13 04:13:26.663907	2025-10-13 04:24:50.933564	\N	82226197047	\N	Top Up 3 Diamond	wafiq610@gmail.com	fee default : 11106	0
10	5	RS01760509378913059700	MLID3	0	1396007302706	11106	11106	1022.00	0.00	12128	failed	Alamat IP tidak sesuai	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540812128.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJKF9UAJW02120819190858480309ZILOGGAME0520NQ6121_0_DD459069E750703A016304A377	2025-10-15 06:22:58.864852	2025-10-30 04:27:44.942954	\N	82226197047		3 Diamond	wafiq610@gmail.com	fee default : 11106	0
3	5	RS141760333719896865500	VML3	14	1396007302706	11106	11106	77.00	0.00	11183	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540811183.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJH97LCK802120819190858480309ZILOGGAME0520NQ6121_0_7FE8759C21D0703A016304D85D","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25FBUBENE7PNE3S1P","amount":"11183","reference":"D2033625KISQ3YOD5EP6POI","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540811183.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJH97LCK802120819190858480309ZILOGGAME0520NQ6121_0_7FE8759C21D0703A016304D85D	2025-10-13 05:35:20.045737	2025-10-13 12:35:21.980662	\N	82226197047	\N	Top Up 3 Diamond	wafiq610@gmail.com	fee default : 11106	0
4	2	RS01760343757387091460	VML10	0	1396007302706	100	13237	1000.00	-13137.00	1100	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071100.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJHUQNGWV02120819190858480309ZILOGGAME0520NQ6121_0_0F3D9F040BD0703A0163044092","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ252ARWA4FSPYK3WMS","amount":"1100","reference":"D2033625EZI517DYLJNM82M","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071100.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJHUQNGWV02120819190858480309ZILOGGAME0520NQ6121_0_0F3D9F040BD0703A0163044092	2025-10-13 08:22:37.344417	2025-10-13 08:22:39.66879	\N	82226197047	\N	Top Up 10 Diamond (9 + 1 Bonus)	wafiq610@gmail.com	fee default : 100	0
5	2	RS0176034381850706875	VML10	0	1396007302706	100	13237	1000.00	-13137.00	1100	process	status=1&message=OtomaX: TrxID=13, tujuan=1396007302706, kode=CEKIDVML akan diproses @15:42. harga=0, Saldo=0 * TRX Normal	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071100.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJHFMU7Z102120819190858480309ZILOGGAME0520NQ6121_0_1546F5078B20703A0163042BF0	2025-10-13 08:23:38.046221	2025-10-13 08:43:01.332723	\N	82226197047	13	Top Up 10 Diamond (9 + 1 Bonus)	wafiq610@gmail.com	fee default : 100	0
13	5	RS141761125834772966124	MLID3	14	1396007302706	1155	1155	4211.00	0.00	5366	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075366.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ2HXI9RA02120819190858480309ZILOGGAME0520NQ6121_0_6549C5FD1BC0703A0163042241","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25HK0RIUYHSARGQQD","amount":"5366","reference":"D2033625RZYZUKVJDXGD2O4","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075366.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ2HXI9RA02120819190858480309ZILOGGAME0520NQ6121_0_6549C5FD1BC0703A0163042241	2025-10-22 09:37:14.746454	2025-10-22 16:37:16.741952	\N	8226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 1155	0
14	5	RS141761126183921191902	MLID3	14	1396007302705	1155	1155	4211.00	0.00	5366	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075366.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJMSI7CB402120819190858480309ZILOGGAME0520NQ6121_0_81594F545BA0703A0163042CD9","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25MG5R7KU33OF7RWV","amount":"5366","reference":"D2033625P2MDZA7GAEMRGOX","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075366.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJMSI7CB402120819190858480309ZILOGGAME0520NQ6121_0_81594F545BA0703A0163042CD9	2025-10-22 09:43:03.864135	2025-10-22 16:43:06.126334	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 1155	0
6	2	RS01760344359522868393	CEKIDVML	0	1396007302706	100	13237	1000.00	-13137.00	1100	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071100.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ6QGF0LB02120819190858480309ZILOGGAME0520NQ6121_0_1951B87BE9A0703A01630473E7","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25MPC5N7QNZ0MWCR7","amount":"1100","reference":"D2033625W55PBD0XU2XSJQX","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071100.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ6QGF0LB02120819190858480309ZILOGGAME0520NQ6121_0_1951B87BE9A0703A01630473E7	2025-10-13 08:32:39.479418	2025-10-13 08:32:41.529539	\N	82226197047	\N	Top Up 10 Diamond (9 + 1 Bonus)	wafiq610@gmail.com	fee default : 100	0
7	2	RS01760346177353400777 	CEKIDVML	0	1396007302706	100	13237	1000.00	-13137.00	1100	pending	status=1&message=OtomaX: TrxID=13, tujuan=1396007302706, kode=CEKIDVML @15:42, mhn tunggu trx sblmnya selesai, status Menunggu Jawaban. harga=, Saldo=0 * TRX Normal	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071100.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ9B571GF02120819190858480309ZILOGGAME0520NQ6121_0_FF4E0AC24110703A0163046EA6	2025-10-13 09:02:57.305719	2025-10-13 09:03:45.680697	\N	82226197047	13	Top Up 10 Diamond (9 + 1 Bonus)	wafiq610@gmail.com	fee default : 100	0
8	2	RS01760424109911801957	MLID3	0	1396007302706	11106	11106	1022.00	0.00	12128	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540812128.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJF62A0Y802120819190858480309ZILOGGAME0520NQ6121_0_0653F26D5DA0703A0163048F30","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25HPVMUITH4QTU7KK","amount":"12128","reference":"D20336254Q2U27KEKSSG1L8","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540812128.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJF62A0Y802120819190858480309ZILOGGAME0520NQ6121_0_0653F26D5DA0703A0163048F30	2025-10-14 06:41:49.865134	2025-10-14 06:41:51.982525	\N		\N	Top Up 3 Diamond		fee default : 11106	0
9	5	RS01760462003479697706	MLID3	0	1396007302706	11106	11106	1022.00	0.00	12128	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540812128.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJFDYGPE502120819190858480309ZILOGGAME0520NQ6121_0_C8B42F7A9BC0703A01630451AA","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ256GRDHKS5V5UARRX","amount":"12128","reference":"D2033625KCQ6D1Y28YKWAQ6","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540812128.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJFDYGPE502120819190858480309ZILOGGAME0520NQ6121_0_C8B42F7A9BC0703A01630451AA	2025-10-14 17:13:23.392348	2025-10-15 00:13:26.00408	\N	8226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 11106	0
11	5	RS141761125522605226725	MLID3	14	1396007302706	0	1155	4200.00	-1155.00	4200	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054074200.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJNXR7P9102120819190858480309ZILOGGAME0520NQ6121_0_DCB016AE7050703A016304CF86","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25D3RKIV5AY7LOGO1","amount":"4200","reference":"D2033625YXLFQ4RTEUDFREH","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054074200.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJNXR7P9102120819190858480309ZILOGGAME0520NQ6121_0_DCB016AE7050703A016304CF86	2025-10-22 09:32:02.557012	2025-10-22 16:32:04.996455	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 0	0
12	5	RS14176112577365628142	MLID3	14	1396007302706	1155	1155	4211.00	0.00	5366	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075366.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJL71ODZB02120819190858480309ZILOGGAME0520NQ6121_0_418258D4B900703A016304B6E4","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ2557H2Y4RKUKF71E2","amount":"5366","reference":"D20336250HLOZ0KEWDNKGI4","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075366.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJL71ODZB02120819190858480309ZILOGGAME0520NQ6121_0_418258D4B900703A016304B6E4	2025-10-22 09:36:13.001246	2025-10-22 16:36:15.096578	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 1155	0
15	5	RS141761126352259584803	MLID3	14	1396007302706	1155	1155	4211.00	0.00	5366	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075366.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJSYHRUMV02120819190858480309ZILOGGAME0520NQ6121_0_680F882B1F70703A0163048FE6","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25HS0YWKNS4NYKB11","amount":"5366","reference":"D2033625B3KK03BFR3FUDT7","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075366.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJSYHRUMV02120819190858480309ZILOGGAME0520NQ6121_0_680F882B1F70703A0163048FE6	2025-10-22 09:45:52.244578	2025-10-22 16:45:54.552896	\N	8226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 1155	0
16	5	RS141761126663125307931	MLID3	14	1396007302706	2155	1155	4221.00	1000.00	6376	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054076376.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJYK0LOQ902120819190858480309ZILOGGAME0520NQ6121_0_7F93EE7BFD80703A016304E150","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25FEMHHZXGHJO75YT","amount":"6376","reference":"D2033625NGL1GVTN3HTGSV4","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054076376.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJYK0LOQ902120819190858480309ZILOGGAME0520NQ6121_0_7F93EE7BFD80703A016304E150	2025-10-22 09:51:03.090762	2025-10-22 16:51:05.184181	\N	8226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 2155	0
17	6	RS281761551312737053800	MLID3	28	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJAIQDFW902120819190858480309ZILOGGAME0520NQ6121_0_507FE52F1820703A01630463BF","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25DUMB6HTBD6DQ030","amount":"8552","reference":"D2033625IAY3T0O1T4BHJTI","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJAIQDFW902120819190858480309ZILOGGAME0520NQ6121_0_507FE52F1820703A01630463BF	2025-10-27 07:48:33.091989	2025-10-27 14:48:35.275425	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
18	6	RS281761551441796322400	MLID3	28	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJYRLM65C02120819190858480309ZILOGGAME0520NQ6121_0_10DACB9C9110703A01630494BE","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25Q0OPA0ESE41JYJO","amount":"8552","reference":"D203362521XTDKSL61DPDKY","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJYRLM65C02120819190858480309ZILOGGAME0520NQ6121_0_10DACB9C9110703A01630494BE	2025-10-27 07:50:42.193777	2025-10-27 14:50:43.707997	\N	82666197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
19	6	RS281761551521850310000	MLID3	28	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ7YC52GK02120819190858480309ZILOGGAME0520NQ6121_0_427B415C5DC0703A01630415F3","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25CMHKZPS8WWGGIFM","amount":"8552","reference":"D2033625CFYTI74263MUDLM","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ7YC52GK02120819190858480309ZILOGGAME0520NQ6121_0_427B415C5DC0703A01630415F3	2025-10-27 07:52:02.247852	2025-10-27 14:52:03.844897	\N	8226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
20	6	RS28176155156466142900	MLID3	28	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJZIJ1OQ002120819190858480309ZILOGGAME0520NQ6121_0_8FB8221C0D30703A016304D51E","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25LM27SUAK4DM7K6J","amount":"8552","reference":"D2033625TU6DA3K08D1FWUM","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJZIJ1OQ002120819190858480309ZILOGGAME0520NQ6121_0_8FB8221C0D30703A016304D51E	2025-10-27 07:52:44.465703	2025-10-27 14:52:45.907097	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
21	6	RS281761551648162168700	MLID3	28	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJNLIGT6C02120819190858480309ZILOGGAME0520NQ6121_0_F7642C709470703A016304FED2","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25OCDDL0JEO2TLHC0","amount":"8552","reference":"D2033625BRYDLPF2T8S2UBT","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJNLIGT6C02120819190858480309ZILOGGAME0520NQ6121_0_F7642C709470703A016304FED2	2025-10-27 07:54:08.522501	2025-10-27 14:54:10.084391	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
22	6	RS281761551734566252300	MLID3	28	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJY1WJZI802120819190858480309ZILOGGAME0520NQ6121_0_2122CE8CDB70703A0163046859","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25UDBNMHR6A0I6VQ1","amount":"8552","reference":"D2033625NUYIEK7336XB3LN","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJY1WJZI802120819190858480309ZILOGGAME0520NQ6121_0_2122CE8CDB70703A0163046859	2025-10-27 07:55:34.969164	2025-10-27 14:55:36.493399	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
23	6	RS281761551806549237100	MLID3	28	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ1KLQVJ202120819190858480309ZILOGGAME0520NQ6121_0_8C805BA941C0703A016304DC13","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ2502IM5B5AH5FGMZH","amount":"8552","reference":"D2033625R1BQTUMYWMCUZ4X","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ1KLQVJ202120819190858480309ZILOGGAME0520NQ6121_0_8C805BA941C0703A016304DC13	2025-10-27 07:56:46.953097	2025-10-27 14:56:48.381492	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
26	6	RS01761632679248501100	MLID3	0	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJR8N4OPB02120819190858480309ZILOGGAME0520NQ6121_0_04A98E49B0B0703A0163044134","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25FXKQX8UPMVGLNU1","amount":"8552","reference":"D2033625W31FK1OJB23AELK","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJR8N4OPB02120819190858480309ZILOGGAME0520NQ6121_0_04A98E49B0B0703A0163044134	2025-10-28 06:24:39.635321	2025-10-28 13:24:41.707017	\N	82666197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
24	6	RS28176155189753407600	MLID3	28	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJF6MOY3J02120819190858480309ZILOGGAME0520NQ6121_0_0C52B0F4B4D0703A016304F442","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25F12KHVYQPGSWM5M","amount":"8552","reference":"D20336257VDMMYCMXXF0SHU","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJF6MOY3J02120819190858480309ZILOGGAME0520NQ6121_0_0C52B0F4B4D0703A016304F442	2025-10-27 07:58:17.458348	2025-10-27 14:58:18.877062	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
27	6	RS281761743430586936604	MLID3	28	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJGLQUN3E02120819190858480309ZILOGGAME0520NQ6121_0_0AA2AE135B00703A0163045086","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25US0X3WEQBDVYQOY","amount":"8552","reference":"D203362558DVJ8Y80QYJZIW","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJGLQUN3E02120819190858480309ZILOGGAME0520NQ6121_0_0AA2AE135B00703A0163045086	2025-10-29 13:10:30.439253	2025-10-29 20:10:34.074492	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
25	2	RS01761567482488108942	MLID3	0	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJW4CG2TA02120819190858480309ZILOGGAME0520NQ6121_0_95BECC5A8C00703A016304505B","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25FH62NVDGXSCKQ6P","amount":"8552","reference":"D2033625VQENO3HGG7SQQY2","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJW4CG2TA02120819190858480309ZILOGGAME0520NQ6121_0_95BECC5A8C00703A016304505B	2025-10-27 12:18:02.291922	2025-10-27 12:18:06.991807	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
28	6	RS281761743476759437698	MLID3	28	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJGFPNYLD02120819190858480309ZILOGGAME0520NQ6121_0_B928B77ABE00703A0163042A46","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25YOOSB5NO8Y7F7WI","amount":"8552","reference":"D2033625WFLBG6VGP6GBR8C","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJGFPNYLD02120819190858480309ZILOGGAME0520NQ6121_0_B928B77ABE00703A0163042A46	2025-10-29 13:11:16.739155	2025-10-29 20:11:19.129198	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
32	6	RS281761795193152392100	MLID3	28	1396007302706	1000	0	4210.00	-100.00	5210	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075210.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJF4WH6BV02120819190858480309ZILOGGAME0520NQ6121_0_A0403CC347F0703A0163041450","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ257CJMA514E5CBUZU","amount":"5210","reference":"D2033625VWZMHMEZL2R5Z1N","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075210.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJF4WH6BV02120819190858480309ZILOGGAME0520NQ6121_0_A0403CC347F0703A0163041450	2025-10-30 03:33:13.80702	2025-10-30 10:33:15.488713	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 1000	0
29	6	RS281761743784445469733	MLID3	28	1396007302706	4309	4309	4243.00	0.00	8552	success	callback successfully ; RS281761743784445469733	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJORAXGYI02120819190858480309ZILOGGAME0520NQ6121_0_48BD5B8118D0703A016304D58E	2025-10-29 13:16:23.581749	2025-10-29 13:21:59.476609	Mobile Legends / UserID : 139600730 / ZoneID: 2706 / Username : GIKS / Region : ID	82226197047	30	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
52	6	RS0176249666547514500	MLID3	0	1396007302706	5309	4309	4253.00	1000.00	9562	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054079562.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKFW3CUJ702120819190858480309ZILOGGAME0520NQ6121_0_0FEAC223C6B0703A016304AC71","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25KZJVPNI1RYX2MY0","amount":"9562","reference":"D2033625U0DIP1K08PH8YEV","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054079562.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKFW3CUJ702120819190858480309ZILOGGAME0520NQ6121_0_0FEAC223C6B0703A016304AC71	2025-11-07 06:24:24.845778	2025-11-07 13:24:27.23024	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 5309	0
53	6	RS01762496929563642600	MLID3	0	1396007302706	5309	4309	4253.00	1000.00	9562	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054079562.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKH1RXBYD02120819190858480309ZILOGGAME0520NQ6121_0_7FE73AD2EFD0703A0163044B2C","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25BOP4KJMHCI6U7YZ","amount":"9562","reference":"D2033625V8YI2661GAKNG3C","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054079562.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKH1RXBYD02120819190858480309ZILOGGAME0520NQ6121_0_7FE73AD2EFD0703A0163044B2C	2025-11-07 06:28:49.363209	2025-11-07 13:28:52.272438	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 5309	0
31	6	RS281761747288372418373	MLID3	28	1396007302706	4309	4309	4243.00	0.00	8552	failed	Alamat IP tidak sesuai	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJNEZ4CBY02120819190858480309ZILOGGAME0520NQ6121_0_CB3B500FE630703A0163047ACC	2025-10-29 14:14:48.254912	2025-10-29 14:41:07.774307	\N	82226197047		3 Diamond	wafiq610@gmail.com	fee default : 4309	0
56	6	RS281762497700576769900	MLID5	28	1396007302704	4814	4814	0.00	-3314.00	500	paid	\N	SALDO	\N	2025-11-07 06:41:40.359624	2025-11-07 13:41:40.801295	\N	82226197047	145	5 Diamond	wafiq610@gmail.com	fee default : 0	4314
59	6	RS281762498495421984000	MLID5	28	1396007302706	5814	4814	4215.00	-3314.00	5715	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075715.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKDMSFX9G02120819190858480309ZILOGGAME0520NQ6121_0_FD5014451C90703A016304E3B3","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25AI71H2P4LG3DC32","amount":"5715","reference":"D2033625EMC8KQBN3ILB36K","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075715.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKDMSFX9G02120819190858480309ZILOGGAME0520NQ6121_0_FD5014451C90703A016304E3B3	2025-11-07 06:54:55.202539	2025-11-07 13:54:57.606663	\N	82226197047	\N	5 Diamond	wafiq610@gmail.com	fee default : 1500	4314
60	6	RS281762499455832606700	MLID5	28	1396007302706	1500	4814	4171.00	-3314.00	1357	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071357.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK02DATZP02120819190858480309ZILOGGAME0520NQ6121_0_F4DAC89068A0703A016304AAF4","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25DMOQL340NQ0PEP2","amount":"1357","reference":"D2033625XCCMBTGZWM5QWZA","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071357.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK02DATZP02120819190858480309ZILOGGAME0520NQ6121_0_F4DAC89068A0703A016304AAF4	2025-11-07 07:10:55.574136	2025-11-07 14:10:58.035335	\N	82226197047	\N	5 Diamond	wafiq610@gmail.com	fee default : -2814	4314
61	6	RS281762499519943960400	MLID5	28	1396007302706	1500	4814	4215.00	-3314.00	5715	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075715.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKTWHKBLN02120819190858480309ZILOGGAME0520NQ6121_0_47DF0F228160703A016304E9CC","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25NPYPD6JPXHYTCVL","amount":"5715","reference":"D2033625FIGK3FWQXQ1CN4Y","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075715.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKTWHKBLN02120819190858480309ZILOGGAME0520NQ6121_0_47DF0F228160703A016304E9CC	2025-11-07 07:11:59.682375	2025-11-07 14:12:02.093145	\N	82226197047	\N	5 Diamond	wafiq610@gmail.com	fee default : 1500	4314
62	2	RS01763014777157365961	MLID3	0	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKE8ZULKH02120819190858480309ZILOGGAME0520NQ6121_0_5862B51B7E30703A0163049C9C","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ253QKZYTMDVPPTPWZ","amount":"8552","reference":"D2033625BDLG4Y5YUZ74GHP","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKE8ZULKH02120819190858480309ZILOGGAME0520NQ6121_0_5862B51B7E30703A0163049C9C	2025-11-13 06:19:37.11672	2025-11-13 06:19:38.482272	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
63	2	RS01763017176591741313	MLID3	0	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKULKX1TO02120819190858480309ZILOGGAME0520NQ6121_0_CCD32BD25F20703A0163045DBE","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25HHTKMLQYQFL33BK","amount":"8552","reference":"D20336253J2FNAQYGLTI2CO","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKULKX1TO02120819190858480309ZILOGGAME0520NQ6121_0_CCD32BD25F20703A0163045DBE	2025-11-13 06:59:36.550127	2025-11-13 06:59:37.928789	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
33	6	RS281761795220864499500	MLID3	28	1396007302706	1000	0	4210.00	-100.00	5210	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075210.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJWJC8P5H02120819190858480309ZILOGGAME0520NQ6121_0_70B7F340BD80703A016304B1F3","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25L1X0I0KCZIQ8P45","amount":"5210","reference":"D203362522TGK6ZUS2BBQYY","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075210.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJWJC8P5H02120819190858480309ZILOGGAME0520NQ6121_0_70B7F340BD80703A016304B1F3	2025-10-30 03:33:41.542555	2025-10-30 10:33:42.81115	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 1000	0
51	6	TXN3E57CB5C	MLID3	28	1396007302706	5309	4309	0.00	1000.00	5309	failed	Alamat IP tidak sesuai	SALDO	\N	2025-11-07 04:15:49.036238	2025-11-16 13:44:29.874379	MOBILE LEGENDS / UserID : 139600730 / ZoneID: 2706 / Username : GIKS / Region : Indonesia	82226197047		3 Diamond	wafiq610@gmail.com	fee default : 5309	0
64	2	RS01763353469295025160	FFID5	0	7844322195	4129	4129	2233.00	0.00	6362	pending	\N	DA	\N	2025-11-17 04:24:29.256619	2025-11-17 04:24:29.256619	\N	81268541912	\N	5 Diamond		fee default : 69	0
34	6	RS281761803683838281300	MLID3	28	1396007302706	1000	0	4210.00	-100.00	5210	failed	status=43&message='R#RS281761803683838281...' GAGAL. Saldo tidak cukup. Hrg 1.100, Saldo 0 Limit 0, proses 0. KetikTIKET utk deposit * TRX Normal	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075210.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ80MG9SX02120819190858480309ZILOGGAME0520NQ6121_0_D410CD0BFF40703A0163047B76	2025-10-30 05:54:44.622575	2025-10-30 06:44:22.867724	\N	82226197047		3 Diamond	wafiq610@gmail.com	fee default : 1000	0
65	2	RS0176335651772740802	MLID3	0	159306967716696	4310	4310	4243.00	0.00	8553	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078553.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK6HFPW4E02120819190858480309ZILOGGAME0520NQ6121_0_04036ACA4F30703A0163043DF3","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25T1ULLJN3JP62WQ4","amount":"8553","reference":"D2033625EGC6W46PUZF0XO3","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078553.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK6HFPW4E02120819190858480309ZILOGGAME0520NQ6121_0_04036ACA4F30703A0163043DF3	2025-11-17 05:15:17.027025	2025-11-17 05:15:17.881485	\N	81268541912	\N	3 Diamond		fee default : 4310	0
35	2	RS01761841744556147033	CHECKIDVML	0	1396007302706	4309	4309	4243.00	0.00	8552	paid	status=43&message='R#RS017618417445561470...' GAGAL. Saldo tidak cukup. Hrg 1.100, Saldo 0 Limit 0, proses 0. KetikTIKET utk deposit * TRX Normal	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJIU32SZR02120819190858480309ZILOGGAME0520NQ6121_0_CEB5F216A340703A0163042A1F	2025-10-30 16:29:04.497174	2025-10-30 17:02:59.470465	\N	82226197047		3 Diamond	wafiq610@gmail.com	fee default : 4309	0
37	2	RS121762241646141673231	FFID55	12	2761262063	10334	10334	4303.00	0.00	14637	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540814637.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKSWOGICX02120819190858480309ZILOGGAME0520NQ6121_0_0607F1610220703A016304F7CD","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ255XBLGXMBIR6YRSK","amount":"14637","reference":"D2033625XT3H502WYZQA4IE","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540814637.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKSWOGICX02120819190858480309ZILOGGAME0520NQ6121_0_0607F1610220703A016304F7CD	2025-11-04 07:34:06.119343	2025-11-04 07:34:08.949063	\N	81535485848	\N	55 Diamond		fee default : 10334	0
36	2	RS01762241566792538931	FFID5	0	2761262063	4129	4129	4241.00	0.00	8370	failed	Alamat IP tidak sesuai	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078370.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKALHXES302120819190858480309ZILOGGAME0520NQ6121_0_24AAF4FBC1C0703A0163049C67	2025-11-04 07:32:46.748411	2025-11-04 07:36:11.782078	\N	81535485848		5 Diamond		fee default : 4129	0
66	2	TXN4B84E3C9	FFID5	0	7844322195	4129	4129	4241.00	0.00	8370	process	status=1&message=RefID=RS0176335659764450679, TrxID=211, tujuan=7844322195, kode=FFID5 akan diproses @12:17. harga=921, Saldo=175.160 * TRX Normal	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078370.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKOH2T5SF02120819190858480309ZILOGGAME0520NQ6121_0_AEB6D8E89EE0703A016304E67F	2025-11-17 05:16:37.020607	2025-11-17 05:17:08.000848	\N	81268541912	211	5 Diamond		fee default : 4129	0
38	2	RS121762243833171167080	MLID5	12	1396007302706	4814	4814	4248.00	0.00	9062	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054079062.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKX9KV3GL02120819190858480309ZILOGGAME0520NQ6121_0_D4BA13B08D90703A0163043C47","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25MN3ZORMD357LAKE","amount":"9062","reference":"D2033625CGATJK4JJ3TIXCD","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054079062.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKX9KV3GL02120819190858480309ZILOGGAME0520NQ6121_0_D4BA13B08D90703A0163043C47	2025-11-04 08:10:33.120626	2025-11-04 08:10:35.379142	\N	82226197047	\N	5 Diamond	wafiq610@gmail.com	fee default : 4814	0
67	2	RS01763358756358012798	FFID5	0	2676884568	4129	4129	1725.00	0.00	5854	pending	{"status":"","code":"","message":"","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=OV25ZNLZQTDCJSOFRJO","amount":"5854","reference":"D2033625C46AHVBC27V4SIP","statusCode":"00","statusMessage":"SUCCESS"}	OV	https://passport.duitku.com/topup/topupdirectv2.aspx?ref=OV25ZNLZQTDCJSOFRJO	2025-11-17 05:52:36.31454	2025-11-17 05:52:36.766344	\N	81268541912	\N	5 Diamond		fee default : 69	0
68	2	RS01763358805963185198	FFID5	0	2676884568	4129	4129	1725.00	0.00	5854	success	RefID=13659432, TrxID=212, tujuan=2676884568, kode=FFID5, SUKSES. sn=RewlzzㅤBF . Refid: SK251117CFEYJ05VG6, harga=921, Saldo=175.160 @17/11 12:55:10 * TRX Normal	OV	https://passport.duitku.com/topup/topupdirectv2.aspx?ref=OV256PKJI4FOHS7BLM8	2025-11-17 05:53:25.91975	2025-11-17 05:55:10.952717	RewlzzㅤBF . Refid: SK251117CFEYJ05VG6	81268541912	212	5 Diamond		fee default : 69	0
39	2	RS121762246329951136708	FFID5	12	11235363262	4129	4129	4241.00	0.00	8370	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078370.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKAFS0LRV02120819190858480309ZILOGGAME0520NQ6121_0_CA08A3228AD0703A01630436FA","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25EY3QCS8FVOBRH8D","amount":"8370","reference":"D2033625BJSXGJQATDJ8Z0H","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078370.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKAFS0LRV02120819190858480309ZILOGGAME0520NQ6121_0_CA08A3228AD0703A01630436FA	2025-11-04 08:52:09.917911	2025-11-04 08:52:12.015257	\N	81236445596	\N	5 Diamond		fee default : 4129	0
40	2	RS01762324393608692640	MLID3	0	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKR4MSDAX02120819190858480309ZILOGGAME0520NQ6121_0_1FA7AFA4EBA0703A01630447F4","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25XMA7DD1XZ7G15NB","amount":"8552","reference":"D2033625YPNQK2SUARHGFTI","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKR4MSDAX02120819190858480309ZILOGGAME0520NQ6121_0_1FA7AFA4EBA0703A01630447F4	2025-11-05 06:33:13.5724	2025-11-05 06:33:15.749463	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
41	2	RS01762324437120669933	MLID3	0	1396007302706	4309	4309	4243.00	0.00	8552	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKJMC0PDX02120819190858480309ZILOGGAME0520NQ6121_0_B2F203DE6450703A016304D205","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25W81QLP71SPB35R3","amount":"8552","reference":"D2033625G6NBK6DC3XVCC15","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054078552.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKJMC0PDX02120819190858480309ZILOGGAME0520NQ6121_0_B2F203DE6450703A016304D205	2025-11-05 06:33:57.077987	2025-11-05 06:33:59.37356	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 4309	0
42	2	RS121762325302593853556	MLID3	12	1396007302706	1000	4309	4210.00	-3309.00	5210	pending	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075210.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKEXQZGTF02120819190858480309ZILOGGAME0520NQ6121_0_4C485E226FD0703A016304D737","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ252D70T5DS86YRUEL","amount":"5210","reference":"D2033625BNY05DFVINWI1HL","statusCode":"00","statusMessage":"SUCCESS"}	SQ	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075210.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKEXQZGTF02120819190858480309ZILOGGAME0520NQ6121_0_4C485E226FD0703A016304D737	2025-11-05 06:48:22.564505	2025-11-05 06:48:25.469988	\N	82226197047	\N	3 Diamond	wafiq610@gmail.com	fee default : 1000	3309
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.transactions (id, user_id, amount, tujuan, nickname, status, profit, profit_keterangan, payment_method, fee, discount, created_at, updated_at, reference_id, serial_number, failed_reason, completed_at, harga_modal, total_amount, payment_payload, flash_sale_id, trx_id, phone_number, email, note, kode_voucher, product_id) FROM stdin;
237	0	2102	1396007302706	GIKS	success	1002	Profit (Role): Rp 1002, Duitku Fee : 2102	SQ	1004	0	2025-10-14 08:20:44.845436	2025-10-14 08:24:49.355392	TXN186E4DCC6AC7C8C52405CA5C677512B2	Mobile Legends / UserID : 139600730 / ZoneID: 2706 / Username : GIKS / Region : ID	status=1&message=: RefID=TXN186E4DCC6AC7C8C52405CA5C677512B2, TrxID=27, tujuan=1396007302706, kode=CEKIDVML akan diproses @15:22. harga=0, Saldo=0 * TRX Normal	\N	1100	3106	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJC6UY2MW02120819190858480309ZILOGGAME0520NQ6121_0_6F49CA3CE2E0703A016304EB2E	\N	27	82226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJC6UY2MW02120819190858480309ZILOGGAME0520NQ6121_0_6F49CA3CE2E0703A016304EB2E","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25WPHS7QXG1JS5SAF","amount":"3106","reference":"D2033625IKJFEM8N17LTAZG","statusCode":"00","statusMessage":"SUCCESS"}		557
229	0	2102	1396007302706	GIKS	pending	1002	Profit (Role): Rp 1002, Duitku Fee : 2102	SQ	1004	0	2025-10-14 07:28:19.271928	2025-10-14 07:28:52.232815	TXN68EDFB93CD192433	Mobile Legends / UserID : 139600730 / ZoneID: 2706 / Username : GIKS / Region : ID	status=1&message=: RefID=TXN68EDFB93CD192433, TrxID=20, tujuan=1396007302706, kode=CEKIDVML akan diproses @14:28. harga=0, Saldo=0 * TRX Normal	\N	1100	3106	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJMXWE9L402120819190858480309ZILOGGAME0520NQ6121_0_BBE53F4851C0703A016304E363	\N	20	82226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJMXWE9L402120819190858480309ZILOGGAME0520NQ6121_0_BBE53F4851C0703A016304E363","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ2508XH7DZ156CDXKR","amount":"3106","reference":"D2033625550EP1JFQSMZKHZ","statusCode":"00","statusMessage":"SUCCESS"}		557
228	0	2102	1396007302706	GIKS	pending	1002	Profit (Role): Rp 1002, Duitku Fee : 2102	SQ	1004	0	2025-10-14 07:24:29.797114	2025-10-14 07:25:07.114086	TXN68EDFAADA763375E	Mobile	status=1&message=: RefID=TXN68EDFAADA763375E, TrxID=19, tujuan=1396007302706, kode=CEKIDVML akan diproses @14:25. harga=0, Saldo=0 * TRX Normal	\N	1100	3106	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJM4JTBEZ02120819190858480309ZILOGGAME0520NQ6121_0_6C8AAB783870703A016304CE32	\N	19	82226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJM4JTBEZ02120819190858480309ZILOGGAME0520NQ6121_0_6C8AAB783870703A016304CE32","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25LM6OX0DU28Q56KK","amount":"3106","reference":"D2033625U27SOIP88RJUXVW","statusCode":"00","statusMessage":"SUCCESS"}		557
238	0	2102	1396007302706	GIKS	success	1002	Profit (Role): Rp 1002, Duitku Fee : 2102	SQ	1004	0	2025-10-14 08:21:24.009222	2025-10-14 08:24:46.426163	TXN186E4DD58FFFF5F84082073E079A94F2	Mobile Legends / UserID : 139600730 / ZoneID: 2706 / Username : GIKS / Region : ID	status=1&message=: RefID=TXN186E4DD58FFFF5F84082073E079A94F2, TrxID=26, tujuan=1396007302706, kode=CEKIDVML akan diproses @15:22. harga=0, Saldo=0 * TRX Normal	\N	1100	3106	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJVF6LOR002120819190858480309ZILOGGAME0520NQ6121_0_5F8A7DD1F8B0703A0163046468	\N	26	82226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJVF6LOR002120819190858480309ZILOGGAME0520NQ6121_0_5F8A7DD1F8B0703A0163046468","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ258WKHG4CWZT6XTF4","amount":"3106","reference":"D2033625P083WVLR07S5701","statusCode":"00","statusMessage":"SUCCESS"}		557
233	0	2102	13966007302706		pending	1002	Profit (Role): Rp 1002, Duitku Fee : 2102	SQ	1004	0	2025-10-14 07:55:48.562311	2025-10-14 07:56:38.789692	TXN68EE020480232911	\N	status=1&message=: RefID=TXN68EE020480232911, TrxID=24, tujuan=13966007302706, kode=CEKIDVML akan diproses @14:56. harga=0, Saldo=0 * TRX Normal	\N	1100	3106	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJN9OFB8J02120819190858480309ZILOGGAME0520NQ6121_0_7F2D20936930703A016304EE41	\N	24	82226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJN9OFB8J02120819190858480309ZILOGGAME0520NQ6121_0_7F2D20936930703A016304EE41","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25EMC07A26VKF655W","amount":"3106","reference":"D2033625614VAF3457O0S65","statusCode":"00","statusMessage":"SUCCESS"}		557
235	0	2102	1396007302706	GIKS	success	1002	Profit (Role): Rp 1002, Duitku Fee : 2102	SQ	1004	0	2025-10-14 08:04:28.578004	2025-10-14 08:24:41.240757	TXN186E4CE9197FC0B4945EF9BF2D567BFD	Mobile Legends / UserID : 139600730 / ZoneID: 2706 / Username : GIKS / Region : ID	status=1&message=: RefID=TXN186E4CE9197FC0B4945EF9BF2D567BFD, TrxID=25, tujuan=1396007302706, kode=CEKIDVML sdh pernah jam 15:18, status Sedang Diproses. SN/Ref: . Trx ke-2/hr: CEKIDVML.2.1396007302706.pin. Saldo 0 * TRX Normal	\N	1100	3106	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ62CEFK002120819190858480309ZILOGGAME0520NQ6121_0_097888E90920703A016304B156	\N	25	82226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ62CEFK002120819190858480309ZILOGGAME0520NQ6121_0_097888E90920703A016304B156","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25SQ4Z6AKTAA704MH","amount":"3106","reference":"D2033625PAUHK77NR7WT5VA","statusCode":"00","statusMessage":"SUCCESS"}		557
236	0	2102	1396007302706	GIKS	pending	1002	Profit (Role): Rp 1002, Duitku Fee : 2102	SQ	1004	0	2025-10-14 08:05:40.209519	2025-10-14 08:08:52.364531	TXN186E4CF9D1484F684C345E9291A8E34B	\N	status=1&message=: RefID=TXN186E4CF9D1484F684C345E9291A8E34B, TrxID=23, tujuan=1396007302706, kode=CEKIDVML @14:53, mhn tunggu trx sblmnya selesai, status Sedang Diproses. harga=, Saldo=0 * TRX Normal	\N	1100	3106	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ28TKM9002120819190858480309ZILOGGAME0520NQ6121_0_64AF57B4F720703A016304888E	\N	23	82226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ28TKM9002120819190858480309ZILOGGAME0520NQ6121_0_64AF57B4F720703A016304888E","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25MX80GT2E0Y41OY6","amount":"3106","reference":"D2033625WZYGPNBGH2KWA32","statusCode":"00","statusMessage":"SUCCESS"}		557
225	0	2102	1396007302706	GIKS	pending	1002	Profit (Role): Rp 1002, Duitku Fee : 2102	SQ	1004	0	2025-10-14 07:13:12.531101	2025-10-14 07:14:12.219775	TXN68EDF80881294882	\N	status=1&message=: RefID=TXN68EDF80881294882, TrxID=16, tujuan=1396007302706, kode=CEKIDVML akan diproses @14:14. harga=0, Saldo=0 * TRX Normal	\N	1100	3106	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ6FZQINU02120819190858480309ZILOGGAME0520NQ6121_0_BB846497CAB0703A0163044896	\N		82226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ6FZQINU02120819190858480309ZILOGGAME0520NQ6121_0_BB846497CAB0703A0163044896","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25EC2FH2ALVNQF4CI","amount":"3106","reference":"D2033625P187ZSBYVYQ762K","statusCode":"00","statusMessage":"SUCCESS"}		557
226	0	2102	1396007302706	GIKS	pending	1002	Profit (Role): Rp 1002, Duitku Fee : 2102	SQ	1004	0	2025-10-14 07:16:27.766627	2025-10-14 07:16:29.594397	TXN68EDF8CB682FB19A	\N	\N	\N	1100	3106	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ8QZYHWC02120819190858480309ZILOGGAME0520NQ6121_0_A38128BEEEB0703A016304609E	\N	\N	82226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ8QZYHWC02120819190858480309ZILOGGAME0520NQ6121_0_A38128BEEEB0703A016304609E","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25L82AIU43A2QYZFA","amount":"3106","reference":"D2033625CKKJBRVY1RC7IYM","statusCode":"00","statusMessage":"SUCCESS"}		557
234	0	2102	1396007302706	GIKS	pending	1002	Profit (Role): Rp 1002, Duitku Fee : 2102	SQ	1004	0	2025-10-14 07:57:47.773158	2025-10-14 08:11:14.491184	TXN68EE027B35F7FAC9	\N	status=1&message=: RefID=TXN68EE027B35F7FAC9, TrxID=23, tujuan=1396007302706, kode=CEKIDVML @14:53, mhn tunggu trx sblmnya selesai, status Sedang Diproses. harga=, Saldo=0 * TRX Normal	\N	1100	3106	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ7NYBE4302120819190858480309ZILOGGAME0520NQ6121_0_6C445BA42010703A016304385C	\N	23	82226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ7NYBE4302120819190858480309ZILOGGAME0520NQ6121_0_6C445BA42010703A016304385C","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25ZPHLJUQVJXBDCVV","amount":"3106","reference":"D2033625ZPLXQK6ZWXMYSD0","statusCode":"00","statusMessage":"SUCCESS"}		557
231	0	2102	1396007302706	GIKS	pending	1002	Profit (Role): Rp 1002, Duitku Fee : 2102	SQ	1004	0	2025-10-14 07:49:13.039904	2025-10-14 07:49:37.561608	TXN68EE00795F861D59	\N	status=1&message=: RefID=TXN68EE00795F861D59, TrxID=22, tujuan=1396007302706, kode=CEKIDVML akan diproses @14:49. harga=0, Saldo=0 * TRX Normal	\N	1100	3106	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJINK70G102120819190858480309ZILOGGAME0520NQ6121_0_8F6F84350250703A01630469F8	\N	22	81535485848	Ragilsevenla7@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJINK70G102120819190858480309ZILOGGAME0520NQ6121_0_8F6F84350250703A01630469F8","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ252JSWQ5BZ3HWMM1V","amount":"3106","reference":"D20336254N5NINZ5X1TCPIV","statusCode":"00","statusMessage":"SUCCESS"}		557
230	0	2102	1396007302706	GIKS	pending	1002	Profit (Role): Rp 1002, Duitku Fee : 2102	SQ	1004	0	2025-10-14 07:46:19.526337	2025-10-14 07:47:30.004279	TXN68EDFFCBDEC47D31	Mobile Legends / UserID : 139600730 / ZoneID: 2706 / Username : GIKS / Region : ID	status=1&message=: RefID=TXN68EDFFCBDEC47D31, TrxID=21, tujuan=1396007302706, kode=CEKIDVML akan diproses @14:47. harga=0, Saldo=0 * TRX Normal	\N	1100	3106	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ7WRK15E02120819190858480309ZILOGGAME0520NQ6121_0_B5FDCDEF6100703A0163041706	\N	21	81535485848	Ragilsevenla7@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ7WRK15E02120819190858480309ZILOGGAME0520NQ6121_0_B5FDCDEF6100703A0163041706","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25QRDUDIL54KV8YY6","amount":"3106","reference":"D2033625U7JPSVP7VGUVHI8","statusCode":"00","statusMessage":"SUCCESS"}		557
289	43	13052	1510761030002		pending	502	Profit (Role): Rp 502, Duitku Fee : 2500	FT	3104	0	2025-11-06 15:32:44.537496	2025-11-06 08:32:45.414802	TXNC63858AB	\N	\N	\N	12550	16156	021113215015	\N	\N	81268541912		{"status":"","code":"","message":"","vaNumber":"021113215015","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=FT25A0GVEHS4ZS8O1HE","amount":"16156","reference":"D2033625ULY8SL4CJV1QLR5","statusCode":"00","statusMessage":"SUCCESS"}		1522
232	0	2603	1396007302706	GIKS	pending	1003	Profit (Role): Rp 1003, Duitku Fee : 2603	SQ	1005	0	2025-10-14 07:50:01.733313	2025-10-14 07:53:58.729374	TXN68EE00A99BB916AF	\N	status=1&message=: RefID=TXN68EE00A99BB916AF, TrxID=23, tujuan=1396007302706, kode=CEKIDVML akan diproses @14:53. harga=0, Saldo=0 * TRX Normal	\N	1600	3608	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073608.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ3BXUGJH02120819190858480309ZILOGGAME0520NQ6121_0_B39FB95845A0703A016304AA6B	\N	23	81535485848	Ragilsevenla7@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073608.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ3BXUGJH02120819190858480309ZILOGGAME0520NQ6121_0_B39FB95845A0703A016304AA6B","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25NA1QDZBEMDYXU7P","amount":"3608","reference":"D2033625I47QXM554W7H5QF","statusCode":"00","statusMessage":"SUCCESS"}		573
227	0	2102	1396007302706	GIKS	pending	1002	Profit (Role): Rp 1002, Duitku Fee : 2102	SQ	1004	0	2025-10-14 07:20:16.955627	2025-10-14 07:20:30.732752	TXN68EDF9B043DA5002	Mobile	status=1&message=: RefID=TXN68EDF9B043DA5002, TrxID=18, tujuan=1396007302706, kode=CEKIDVML akan diproses @14:20. harga=0, Saldo=0 * TRX Normal	\N	1100	3106	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJAME5KY702120819190858480309ZILOGGAME0520NQ6121_0_C2C698FF4020703A016304B68A	\N	18	82226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054073106.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJAME5KY702120819190858480309ZILOGGAME0520NQ6121_0_C2C698FF4020703A016304B68A","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25UUENY4WJF4KAA0J","amount":"3106","reference":"D2033625YVW7ZQR7FWDA0NK","statusCode":"00","statusMessage":"SUCCESS"}		557
239	0	3805	1396007302706	GIKS	pending	1005	Profit (Role): Rp 1005, Duitku Fee : 3805	SQ	1007	0	2025-10-15 15:23:34.88299	2025-10-15 15:23:36.929888	TXN186E9C889216228449A726E21CA9E57A	\N	\N	\N	2800	4812	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054074812.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJHCBLXFP02120819190858480309ZILOGGAME0520NQ6121_0_46423C6FDD60703A016304A216	\N	\N	82226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054074812.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJHCBLXFP02120819190858480309ZILOGGAME0520NQ6121_0_46423C6FDD60703A016304A216","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ251U675N8QZ5BZYGI","amount":"4812","reference":"D2033625P2V117R64AL2ALY","statusCode":"00","statusMessage":"SUCCESS"}		708
249	14	2452	1396007302706	GIKS	pending	1352	Profit (Role): Rp 1352, Duitku Fee : 2452	SQ	17	0	2025-10-19 16:13:01.246008	2025-10-19 16:13:03.213419	TXN1492ABCC	\N	\N	\N	1100	2469	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072469.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJV8POMBI02120819190858480309ZILOGGAME0520NQ6121_0_6AC7B53057C0703A0163046A0F	\N	\N	082226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072469.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJV8POMBI02120819190858480309ZILOGGAME0520NQ6121_0_6AC7B53057C0703A0163046A0F","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25OCDWX25XHVQJDAD","amount":"2469","reference":"D2033625141ICH133AOKNAE","statusCode":"00","statusMessage":"SUCCESS"}		678
291	12	1144	1396007302706	GIKS	pending	44	Profit (Role): Rp 44	SALDO	0	0	2025-11-06 22:01:39.915525	2025-11-06 22:01:39.915525	TXN2160E1D2	\N	\N	\N	1100	1144		\N	\N	082226197047	wafiq610@gmail.com			2051
310	12	1664	1396007302706	GIKS	failed	64	Profit (Role): Rp 64	SALDO	0	0	2025-11-07 10:10:19.472483	2025-11-07 10:10:39.969138	TXN2E99DE21		RefID=TXN2E99DE21, TrxID=153, tujuan=1396007302706, kode=MLID5 GAGAL ket=timeout. harga=1.600, Saldo=32.391 @17:10 * TRX Normal	\N	1600	1664		\N	153	082226197047	wafiq610@gmail.com			2067
250	12	2215	1562177676	LYH•Immortal	pending	1294	Profit (Role): Rp 1294, Duitku Fee : 2215	SQ	15	0	2025-10-20 13:37:25.0567	2025-10-20 06:37:28.189731	TXN419B6197	\N	\N	\N	921	2230	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072230.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ8NXTU2H02120819190858480309ZILOGGAME0520NQ6121_0_462D52031E40703A016304F320	\N	\N	081268541912	asdasdasdsga@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072230.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ8NXTU2H02120819190858480309ZILOGGAME0520NQ6121_0_462D52031E40703A016304F320","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ2520LUHAHDJPN3OLD","amount":"2230","reference":"D2033625GIBRP6P5CXMTHBY","statusCode":"00","statusMessage":"SUCCESS"}		852
251	12	2215	1562177676	LYH•Immortal	pending	1294	Profit (Role): Rp 1294, Duitku Fee : 2215	SQ	15	0	2025-10-20 13:39:35.728321	2025-10-20 06:39:37.75373	TXN421D6C33	\N	\N	\N	921	2230	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072230.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJNQVRF2702120819190858480309ZILOGGAME0520NQ6121_0_F7C9BBDBD5D0703A0163043AEF	\N	\N	0812685499591	ragilsevenla7@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072230.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJNQVRF2702120819190858480309ZILOGGAME0520NQ6121_0_F7C9BBDBD5D0703A0163043AEF","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25YVG8BRH2CI6SDV5","amount":"2230","reference":"D2033625XL8USJDD5TR1TZA","statusCode":"00","statusMessage":"SUCCESS"}		852
292	12	1144	1396007302706	GIKS	pending	44	Profit (Role): Rp 44	SALDO	0	0	2025-11-06 22:08:27.79058	2025-11-06 22:08:27.79058	TXN22F80549	\N	\N	\N	1100	1144		\N	\N	082226197047	wafiq610@gmail.com			2051
242	27	2215	739851876	'INVㅤBles⁶⁹࿐	failed	1294	Profit (Role): Rp 1294, Duitku Fee : 2215	SQ	15	0	2025-10-15 15:23:34.88299	2025-10-15 15:23:36.929888	TXN186FC30E708BC85B23D94B3E5AD2DCA6	\N	status=43&message=: 'R#TXN186FC30E708BC85B2...' GAGAL. Saldo tidak cukup. Hrg 921, Saldo 0 Limit 0, proses 0. KetikTIKET utk deposit * TRX Normal	\N	921	2230	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072230.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJPXBQD2V02120819190858480309ZILOGGAME0520NQ6121_0_C80143327D40703A0163045217	\N		82226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072230.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJPXBQD2V02120819190858480309ZILOGGAME0520NQ6121_0_C80143327D40703A0163045217","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25TSGPI80BOCFLLAN","amount":"2230","reference":"D2033625V18LFFGYINZU6WQ","statusCode":"00","statusMessage":"SUCCESS"}		852
243	27	2215	739851876	'INVㅤBles⁶⁹࿐	pending	1294	Profit (Role): Rp 1294, Duitku Fee : 2215	SQ	15	0	2025-10-19 02:58:54.457042	2025-10-19 02:58:56.803265	TXN186FC5233BC14B4F1D5828E8E9586227	\N	\N	\N	921	2230	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072230.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJQBKNCAY02120819190858480309ZILOGGAME0520NQ6121_0_B95CE3F95C70703A016304CA53	\N	\N	8226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072230.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJQBKNCAY02120819190858480309ZILOGGAME0520NQ6121_0_B95CE3F95C70703A016304CA53","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ258X0VD1PH3CEX4KO","amount":"2230","reference":"D2033625KG50HT8P4K7V0HR","statusCode":"00","statusMessage":"SUCCESS"}		852
244	27	2452	1396007302706	GIKS	pending	1352	Profit (Role): Rp 1352, Duitku Fee : 2452	SQ	17	0	2025-10-19 10:03:44.05084	2025-10-19 03:03:47.315463	TXN186FC566A8EDAC9F80A76603031AF7C2	\N	\N	\N	1100	2469	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072469.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJZPHO3YU02120819190858480309ZILOGGAME0520NQ6121_0_84C7E122FFE0703A016304A8FF	\N	\N	082226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072469.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJZPHO3YU02120819190858480309ZILOGGAME0520NQ6121_0_84C7E122FFE0703A016304A8FF","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ257SZNI8EZA6CD66Q","amount":"2469","reference":"D2033625I8DDXJAHQ87IN5P","statusCode":"00","statusMessage":"SUCCESS"}		678
245	14	2452	1396007302706	GIKS	pending	1352	Profit (Role): Rp 1352, Duitku Fee : 2452	SQ	17	0	2025-10-19 15:54:04.904152	2025-10-19 15:54:07.273514	TXN186FD884ED493B6C932E6FC85329F60B	\N	\N	\N	1100	2469	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072469.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJZ28CKIY02120819190858480309ZILOGGAME0520NQ6121_0_1092DF421F20703A01630445DD	\N	\N	082226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072469.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJZ28CKIY02120819190858480309ZILOGGAME0520NQ6121_0_1092DF421F20703A01630445DD","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25G2SBOMIKHQUVTDF","amount":"2469","reference":"D2033625A4TAYKR4U2H6PVD","statusCode":"00","statusMessage":"SUCCESS"}		678
246	14	2452	1396007302706	GIKS	pending	1352	Profit (Role): Rp 1352, Duitku Fee : 2452	SQ	17	0	2025-10-19 15:56:34.835651	2025-10-19 15:56:36.790402	TXN10B795DD	\N	\N	\N	1100	2469	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072469.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJF5OZLXV02120819190858480309ZILOGGAME0520NQ6121_0_0AF44B80CC90703A016304186B	\N	\N	082226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072469.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJF5OZLXV02120819190858480309ZILOGGAME0520NQ6121_0_0AF44B80CC90703A016304186B","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25T0MXMQTWI3ZNQR6","amount":"2469","reference":"D2033625KXKNNQJDSBJ2TMH","statusCode":"00","statusMessage":"SUCCESS"}		678
247	14	2452	1396007302706	GIKS	pending	1352	Profit (Role): Rp 1352, Duitku Fee : 2452	SQ	17	0	2025-10-19 16:01:13.286347	2025-10-19 16:01:15.484068	TXN11CE3BD4	\N	\N	\N	1100	2469	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072469.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJZY1WATG02120819190858480309ZILOGGAME0520NQ6121_0_B50693281570703A01630465F5	\N	\N	082226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072469.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJZY1WATG02120819190858480309ZILOGGAME0520NQ6121_0_B50693281570703A01630465F5","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25VD5NM87E84JU6J3","amount":"2469","reference":"D2033625WL78SMQHKFJR2RE","statusCode":"00","statusMessage":"SUCCESS"}		678
248	14	2452	1396007302706	GIKS	pending	1352	Profit (Role): Rp 1352, Duitku Fee : 2452	SQ	17	0	2025-10-19 16:03:24.742684	2025-10-19 16:03:26.556086	TXN1251F6E9	\N	\N	\N	1100	2469	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072469.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJXCKTP5B02120819190858480309ZILOGGAME0520NQ6121_0_7CA9BE1A8F60703A0163049050	\N	\N	082226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072469.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJXCKTP5B02120819190858480309ZILOGGAME0520NQ6121_0_7CA9BE1A8F60703A0163049050","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25XV4EZWYZCOFW6FD","amount":"2469","reference":"D20336250YS72K5KROSH8L4","statusCode":"00","statusMessage":"SUCCESS"}		678
252	12	2215	1562177676	LYH•Immortal	pending	1294	Profit (Role): Rp 1294, Duitku Fee : 2215	SQ	15	0	2025-10-20 13:41:15.860086	2025-10-20 06:41:17.955904	TXN4281472C	\N	\N	\N	921	2230	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072230.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJT1OQ0Y802120819190858480309ZILOGGAME0520NQ6121_0_5C9F99785940703A016304DED9	\N	\N	0812685499591	ragilsevenla7@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054072230.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJT1OQ0Y802120819190858480309ZILOGGAME0520NQ6121_0_5C9F99785940703A016304DED9","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25WSIE664KOFFO3MM","amount":"2230","reference":"D2033625PB2V86THQCMTLK1","statusCode":"00","statusMessage":"SUCCESS"}		852
253	14	1322	1396007302706	GIKS	pending	222	Profit (Role): Rp 222, Duitku Fee : 1322	SQ	4011	0	2025-10-20 23:39:34.384855	2025-10-20 23:39:37.014032	TXNCEBC588A	\N	\N	\N	1100	5333	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075333.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJN3VMJ6Z02120819190858480309ZILOGGAME0520NQ6121_0_C845ED0FA650703A016304998C	\N	\N	082226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075333.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJN3VMJ6Z02120819190858480309ZILOGGAME0520NQ6121_0_C845ED0FA650703A016304998C","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25FMAN1CPBKKQOLZA","amount":"5333","reference":"D2033625E14RQPMB6FJVN1B","statusCode":"00","statusMessage":"SUCCESS"}		678
254	14	1322	1396007302706	GIKS	pending	222	Profit (Role): Rp 222, Duitku Fee : 1322	SQ	4011	0	2025-10-20 23:41:28.069755	2025-10-20 23:41:30.569155	TXNCF2EC026	\N	\N	\N	1100	5333	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075333.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJT6NBYM002120819190858480309ZILOGGAME0520NQ6121_0_235A15D2D970703A0163045870	\N	\N	082226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075333.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJT6NBYM002120819190858480309ZILOGGAME0520NQ6121_0_235A15D2D970703A0163045870","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25W366QZBCB6V1HHT","amount":"5333","reference":"D20336258LXQWPBLMPMCVX7","statusCode":"00","statusMessage":"SUCCESS"}		678
255	14	1322	1396007302706	GIKS	pending	222	Profit (Role): Rp 222, Duitku Fee : 1322	SQ	4011	0	2025-10-20 23:43:50.841856	2025-10-20 23:43:53.21547	TXNCFBCB59F	\N	\N	\N	1100	5333	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075333.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJNTC6OFB02120819190858480309ZILOGGAME0520NQ6121_0_59B3FF876160703A0163045FFC	\N	\N	082226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075333.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJNTC6OFB02120819190858480309ZILOGGAME0520NQ6121_0_59B3FF876160703A0163045FFC","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25TNFXFJJ1EYO7C8O","amount":"5333","reference":"D2033625AJAL84TQKS87CH0","statusCode":"00","statusMessage":"SUCCESS"}		678
256	14	1322	1396007302706	GIKS	pending	222	Profit (Role): Rp 222, Duitku Fee : 1322	SQ	4011	0	2025-10-20 23:47:00.912969	2025-10-20 23:47:03.77596	TXND07AA741	\N	\N	\N	1100	5333	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075333.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ80Y9GEP02120819190858480309ZILOGGAME0520NQ6121_0_81849A448D10703A01630474CB	\N	\N	082226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054075333.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ80Y9GEP02120819190858480309ZILOGGAME0520NQ6121_0_81849A448D10703A01630474CB","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25A6VC05AWGM3MT1K","amount":"5333","reference":"D2033625Q6W32LUE18U6U5U","statusCode":"00","statusMessage":"SUCCESS"}		678
257	14	302	1396007302706	GIKS	pending	202	Profit (Role): Rp 202, Duitku Fee : 302	SQ	4002	0	2025-10-23 15:44:12.952994	2025-10-23 15:44:15.052215	TXN53D6696D	\N	\N	\N	100	4304	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054074304.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJKFSGC1302120819190858480309ZILOGGAME0520NQ6121_0_17DDD6328AA0703A016304A06F	\N	\N	082226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054074304.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJKFSGC1302120819190858480309ZILOGGAME0520NQ6121_0_17DDD6328AA0703A016304A06F","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25D70T4ANAMB16IZL","amount":"4304","reference":"D2033625ZBRGSIE3B54G2I2","statusCode":"00","statusMessage":"SUCCESS"}		669
281	12	1144	1396007302706	GIKS	success	44	Profit (Role): Rp 44, Duitku Fee : 1144	SQ	10	0	2025-11-05 15:25:01.128011	2025-11-05 08:36:56.26944	TXN72E88081	GIKS . Refid: SK2511055AV60C8UY3	RefID=13529710, TrxID=115, tujuan=1396007302706, kode=MLID3, SUKSES. sn=GIKS . Refid: SK2511055AV60C8UY3, harga=1.100, Saldo=34.233 @05/11 15:36:55 * TRX Normal	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKCK2RDWI02120819190858480309ZILOGGAME0520NQ6121_0_7AA3229C0550703A016304E82D	\N	115	082226197047	wafiq610@gmail.com	{"merchantOrderId":"D20336","Amount":1154,"refId":"","merchantOrderIds":"TXN72E88081","resultCode":"00","signature":"22df3c15820780072d4a12f325baea32"}		2051
332	12	1144	1396007302706	GIKS	success	44	Profit (Role): Rp 44	SALDO	0	0	2025-11-10 16:14:01.091133	2025-11-10 09:14:06.199662	TXN15EB9E08	GIKS . Refid: SK251110D5CE53OUT1	RefID=13585190, TrxID=177, tujuan=1396007302706, kode=MLID3, SUKSES. sn=GIKS . Refid: SK251110D5CE53OUT1, harga=1.100, Saldo=12.899 @10/11 16:13:58 * TRX Normal	\N	1100	1144		\N	177	082226197047	wafiq610@gmail.com			2051
269	12	15600	1314123072prod_official_asia		process	600	Profit (Role): Rp 600, Duitku Fee : 15600	SQ	140	0	2025-10-29 00:48:10.816335	2025-10-28 17:48:28.349661	TXN6ADB9511	\N	status=1&message=RefID=TXN6ADB9511, TrxID=29, tujuan=1314123072prod_official_asia, kode=HSOS60 akan diproses @00:48. harga=15.000, Saldo=41.833 * TRX Normal	\N	15000	15740	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540815740.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJYIJHPQL02120819190858480309ZILOGGAME0520NQ6121_0_8B817518B6B0703A016304D8D8	\N	29	081535485848		{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540815740.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJYIJHPQL02120819190858480309ZILOGGAME0520NQ6121_0_8B817518B6B0703A016304D8D8","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25WY6TGHNBBECWFB5","amount":"15740","reference":"D2033625QH7N30R6XGG1XWC","statusCode":"00","statusMessage":"SUCCESS"}		1875
279	0	1664	1396007302706	GIKS	pending	64	Profit (Role): Rp 64, Duitku Fee : 1664	SQ	14	0	2025-11-05 04:58:28.036245	2025-11-04 21:58:30.623345	TXNE00EB953	\N	\N	\N	1600	1678	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071678.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKBDPXJL402120819190858480309ZILOGGAME0520NQ6121_0_A8CAF0495D00703A016304D5F0	\N	\N	082226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071678.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKBDPXJL402120819190858480309ZILOGGAME0520NQ6121_0_A8CAF0495D00703A016304D5F0","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25IW6I8NOW02AZWJN","amount":"1678","reference":"D2033625TEV056V12K8ENV6","statusCode":"00","statusMessage":"SUCCESS"}		2067
258	12	15600	838495710|prod_official_asia	S****n	failed	600	Profit (Role): Rp 600, Duitku Fee : 15600	SQ	140	0	2025-10-23 22:38:56.517127	2025-10-23 15:39:51.587607	TXNB50A4654	\N	Alamat IP tidak sesuai	\N	15000	15740	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540815740.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJSPU857I02120819190858480309ZILOGGAME0520NQ6121_0_C6D2DC591460703A016304DD99	\N		81535485848	ragilsevenla7@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540815740.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJSPU857I02120819190858480309ZILOGGAME0520NQ6121_0_C6D2DC591460703A016304DD99","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25QRJURCFUFJD8NNZ","amount":"15740","reference":"D2033625YUJP4GUITCBECGR","statusCode":"00","statusMessage":"SUCCESS"}		958
336	41	11603	838495710prod_official_asia		pending	455	Profit (Role): Rp 455, Duitku Fee: 11603	SQ	104	237	2025-11-16 15:31:43.978713	2025-11-16 08:31:44.509429	TXNF5082583	\N	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540811707.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKA4V9G7D02120819190858480309ZILOGGAME0520NQ6121_0_EABEDE004A10703A0163046814","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25FSL23QW4AP627VZ","amount":"11707","reference":"D2033625W0EKZGNAKIQ41QH","statusCode":"00","statusMessage":"SUCCESS"}	\N	11385	11707	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540811707.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKA4V9G7D02120819190858480309ZILOGGAME0520NQ6121_0_EABEDE004A10703A0163046814	\N	\N	81535485848			NOVEMBERCERIA	1875
286	0	1144	1396007302706	GIKS	failed	44	Profit (Role): Rp 44, Duitku Fee : 1144	SQ	10	0	2025-11-06 05:42:53.647917	2025-11-05 22:43:49.245305	TXN3BF9B886		RefID=TXN3BF9B886, TrxID=121, tujuan=1396007302706, kode=MLID3 GAGAL ket=timeout. harga=1.100, Saldo=34.233 @05:43 * TRX Normal	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK4AYGFUL02120819190858480309ZILOGGAME0520NQ6121_0_3615CF0223E0703A0163047A01	\N	121	81535485848	wafiq610@gmail.com	{"merchantOrderId":"D20336","Amount":1154,"refId":"","merchantOrderIds":"TXN3BF9B886","resultCode":"00","signature":"dd168bc3be9bf87eff7af6090eb332d7"}		2051
282	0	1144	1396007302706	GIKS	failed	44	Profit (Role): Rp 44, Duitku Fee : 1144	SQ	10	0	2025-11-05 20:13:25.116656	2025-11-05 13:55:34.712944	TXNB680532E		RefID=TXNB680532E, TrxID=116, tujuan=1396007302706, kode=MLID3 GAGAL ket=timeout. harga=1.100, Saldo=34.233 @20:14 * TRX Normal	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKLWUH06F02120819190858480309ZILOGGAME0520NQ6121_0_1814C56CAC20703A016304B711	\N	116	081233754846	wafiq610@gmail.com	{"merchantOrderId":"D20336","Amount":1154,"refId":"","merchantOrderIds":"TXNB680532E","resultCode":"00","signature":"1802504a78e294ab6074e787294dfece"}		2051
293	12	1144	139607302706		paid	44	Profit (Role): Rp 44	SALDO	0	0	2025-11-06 22:12:26.314934	2025-11-06 15:12:26.551809	TXN23E7B6B3	\N	\N	\N	1100	1144		\N	\N	082226197047	wafiq610@gmail.com			2051
294	12	1144	1396007302706	GIKS	failed	44	Profit (Role): Rp 44	SALDO	0	0	2025-11-06 22:28:28.752905	2025-11-06 15:28:50.22604	TXN27A99D12		RefID=TXN27A99D12, TrxID=139, tujuan=1396007302706, kode=MLID3 GAGAL ket=timeout. harga=1.100, Saldo=34.233 @22:28 * TRX Normal	\N	1100	1144		\N	139	82226197047	wafiq610@gmail.com			2051
311	12	1144	1396007302706	GIKS	failed	44	Profit (Role): Rp 44	SALDO	0	0	2025-11-07 10:23:30.307111	2025-11-07 10:23:51.174648	TXN31B00207		RefID=TXN31B00207, TrxID=154, tujuan=1396007302706, kode=MLID3 GAGAL ket=timeout. harga=1.100, Saldo=32.391 @17:23 * TRX Normal	\N	1100	1144		\N	154	082226197047	wafiq610@gmail.com			2051
312	0	67704	1510761030002		pending	2604	Profit (Role): Rp 2604, Duitku Fee: 67704	SQ	609	0	2025-11-08 20:35:06.24543	2025-11-08 13:35:08.748193	TXNB019F1BE	\N	\N	\N	65100	68313	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540868313.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKSCXN6UD02120819190858480309ZILOGGAME0520NQ6121_0_A1C850464900703A0163043A37	\N	\N	81268541912		{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540868313.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKSCXN6UD02120819190858480309ZILOGGAME0520NQ6121_0_A1C850464900703A0163043A37","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25RVDSI624NSQH3AM","amount":"68313","reference":"D2033625OIOPL1ZDU1IYA6A","statusCode":"00","statusMessage":"SUCCESS"}		1521
270	12	18720	81002594938		failed	720	Profit (Role): Rp 720, Duitku Fee : 18720	SQ	168	0	2025-10-29 11:13:27.472286	2025-10-29 04:14:00.556288	TXNFD689103	\N	Alamat IP tidak sesuai	\N	18000	18888	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540818888.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJWC5LXZH02120819190858480309ZILOGGAME0520NQ6121_0_FC8BBBF4CEC0703A016304EF9E	\N		81535485848		{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540818888.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJWC5LXZH02120819190858480309ZILOGGAME0520NQ6121_0_FC8BBBF4CEC0703A016304EF9E","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25TF3CW2PDTWAPGRY","amount":"18888","reference":"D2033625HZ2DN6HSRJBGVNV","statusCode":"00","statusMessage":"SUCCESS"}		2191
271	14	100000	null		pending	210343	Transaksi menggunakan tipe percentage dengan nilai 900	SQ	900	210343	2025-10-30 15:14:00.85047	2025-10-30 15:14:02.848469	TXN874B2569	\N	\N	\N	310343	100900	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE5204581653033605409100900.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJA0RJEKU02120819190858480309ZILOGGAME0520NQ6121_0_058A7BB56E80703A016304567E	17	\N			{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE5204581653033605409100900.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJA0RJEKU02120819190858480309ZILOGGAME0520NQ6121_0_058A7BB56E80703A016304567E","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25KE8TVAQO031NB70","amount":"100900","reference":"D2033625ORNDBEQX2VEKZ1S","statusCode":"00","statusMessage":"SUCCESS"}	\N	1430
272	14	100000	null		failed	210343	Transaksi menggunakan tipe percentage dengan nilai 900	SQ	900	210343	2025-10-30 15:14:08.811802	2025-10-30 09:05:36.720434	TXN8753C746	\N	Alamat IP tidak sesuai	\N	310343	100900	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE5204581653033605409100900.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJGJ2CF7U02120819190858480309ZILOGGAME0520NQ6121_0_87605045B560703A01630479D4	17				{"merchantOrderId":"","Amount":0,"refId":"TXN8753C746","merchantOrderIds":"TXN8753C746","resultCode":"00","signature":""}	\N	1430
306	43	957	2534745789		failed	36	Profit (Role): Rp 36	SALDO	0	0	2025-11-07 16:35:54.228854	2025-11-07 09:36:14.84645	TXN26881DA1		RefID=TXN26881DA1, TrxID=148, tujuan=2534745789, kode=FFID5 GAGAL ket=timeout. harga=921, Saldo=34.233 @16:36 * TRX Normal	\N	921	957		\N	148	81535485848				1639
274	0	6760	771247947991851008		success	260	Profit (Role): Rp 260, Duitku Fee : 6760	SQ	60	0	2025-10-31 00:31:51.953275	2025-10-30 17:32:29.678842	TXN0A0B5A9F	Satyr . Refid: SK251031XKT6FY3ZEB	RefID=13466483, TrxID=34, tujuan=771247947991851008, kode=FMFCP40, SUKSES. sn=Satyr . Refid: SK251031XKT6FY3ZEB, harga=6.500, Saldo=35.333 @31/10 00:32:28 * TRX Normal	\N	6500	6820	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054076820.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJFOQNG1L02120819190858480309ZILOGGAME0520NQ6121_0_2E0FC98785D0703A016304E82F	\N	34	81535485848		{"merchantOrderId":"D20336","Amount":6820,"refId":"","merchantOrderIds":"TXN0A0B5A9F","resultCode":"00","signature":"2ab7dacab336055be582faaf4720ff54"}		1731
275	0	375440	1396007302706	GIKS	pending	14440	Profit (Role): Rp 14440, Duitku Fee : 375440	SQ	3378	0	2025-11-03 09:21:44.469207	2025-11-03 02:21:47.299988	TXN7AC010FE	\N	\N	\N	361000	378818	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE5204581653033605409378818.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKRT01KJQ02120819190858480309ZILOGGAME0520NQ6121_0_483D11B20230703A016304F42D	\N	\N	082226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE5204581653033605409378818.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKRT01KJQ02120819190858480309ZILOGGAME0520NQ6121_0_483D11B20230703A016304F42D","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25RIZ6IKQBMFYNH51","amount":"378818","reference":"D20336253JWR2J06L4MZR6V","statusCode":"00","statusMessage":"SUCCESS"}		2036
308	43	957	2534745789		success	36	Profit (Role): Rp 36	SALDO	0	0	2025-11-07 16:37:25.56394	2025-11-07 09:47:20.996835	TXN292A5239	4youSaitama? Refid: SK: 1635166440979425711	RefID=13552021, TrxID=150, tujuan=2534745789, kode=FFID5, SUKSES. sn=4youSaitama? Refid: SK: 1635166440979425711, harga=921, Saldo=32.391 @07/11 16:47:20 * TRX Normal	\N	921	957		\N	150	81535485848				1639
260	12	1139	12041797591	OMONG★KOSONG	success	218	Profit (Role): Rp 218, Duitku Fee : 1139	SQ	10	0	2025-10-23 22:52:40.067733	2025-10-23 16:50:19.873815	TXNB8420657	OMONG?KOSONG . Refid: SK251023UYQCZVPBL8	 RefID=TXNB8420657, TrxID=28, tujuan=12041797591, kode=FFID5, SUKSES. sn=OMONG?KOSONG . Refid: SK251023UYQCZVPBL8, harga=921, Saldo=56.833 @23/10 23:50:19 * TRX Normal	\N	921	1149	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071149.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ3PY14TE02120819190858480309ZILOGGAME0520NQ6121_0_C8F8FCB28B00703A01630498BC	\N	28	81535485848	ragilsevenla7@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071149.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ3PY14TE02120819190858480309ZILOGGAME0520NQ6121_0_C8F8FCB28B00703A01630498BC","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25V0EGLO1NFOP0YDS","amount":"1149","reference":"D2033625JEOLUXQ50CJFB6Y","statusCode":"00","statusMessage":"SUCCESS"}		852
366	0	1144	159306967716696	Uzziee	failed	44	Profit (Role): Rp 44, Duitku Fee: 19	OV	1513	0	2025-11-17 15:53:00.664804	2025-11-17 08:54:23.526349	TXN4B87CF22	\N	{"merchantOrderId":"D20336","Amount":2657,"refId":"","merchantOrderIds":"TXN4B87CF22","resultCode":"01","signature":"82cb13b2e5c92429de334e604d8e5ca8"}	\N	1100	2657	https://passport.duitku.com/topup/topupdirectv2.aspx?ref=OV250K6YRAEII154V5H	\N	\N	81268541912		Transaksi gagal, silahkan hubungi admin untuk bantuan		2051
259	12	15600	838495710|Asia	S****n	failed	600	Profit (Role): Rp 600, Duitku Fee : 15600	SQ	140	0	2025-10-23 22:47:53.980173	2025-10-23 16:06:48.050291	TXNB723B20B	\N	status=52&message=: 60 Oneiric Shard HSOS60.838495710|Asia GAGAL. Nomor tujuan salah. Sal 56.833 @23:06 * TRX Normal	\N	15000	15740	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540815740.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ9HDUXV102120819190858480309ZILOGGAME0520NQ6121_0_ADA350E88FC0703A016304BD26	\N		81535485848	ragilsevenla7@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540815740.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJ9HDUXV102120819190858480309ZILOGGAME0520NQ6121_0_ADA350E88FC0703A016304BD26","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25VY33SKT27UB2HG0","amount":"15740","reference":"D2033625ZNTWIV8ZRDJJM5W","statusCode":"00","statusMessage":"SUCCESS"}		958
261	14	32160	1396007302706	GIKS	pending	8040	Transaksi menggunakan tipe percentage dengan nilai 289	SQ	289	0	2025-10-26 18:26:28.126619	2025-10-26 18:26:31.132432	TXN6E61C50B	\N	\N	\N	40200	32449	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540832449.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJCDM5EFG02120819190858480309ZILOGGAME0520NQ6121_0_ACBE94AAE050703A0163045F4F	11	\N	8226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540832449.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJCDM5EFG02120819190858480309ZILOGGAME0520NQ6121_0_ACBE94AAE050703A0163045F4F","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25HYTYWZ74FJOBIZS","amount":"32449","reference":"D2033625L0OPHQV3AUKQHCF","statusCode":"00","statusMessage":"SUCCESS"}	\N	641
262	14	32160	1396007302706	GIKS	pending	8040	Transaksi menggunakan tipe percentage dengan nilai 289	SQ	289	0	2025-10-26 18:28:38.82026	2025-10-26 18:28:41.474943	TXN6EE4A293	\N	\N	\N	40200	32449	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540832449.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJZRMT8B902120819190858480309ZILOGGAME0520NQ6121_0_E6C2F5FA2FC0703A016304D9CA	11	\N	8226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540832449.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJZRMT8B902120819190858480309ZILOGGAME0520NQ6121_0_E6C2F5FA2FC0703A016304D9CA","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ250WNO3BU030XNHO5","amount":"32449","reference":"D2033625160XINY2WGI683E","statusCode":"00","statusMessage":"SUCCESS"}	\N	641
263	14	20000	1396007302706	GIKS	pending	500	Transaksi menggunakan tipe percentage dengan nilai 180	SQ	180	0	2025-10-26 18:29:14.432367	2025-10-26 18:29:16.602496	TXN6F086A68	\N	\N	\N	20500	20180	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540820180.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJM5TPRN002120819190858480309ZILOGGAME0520NQ6121_0_352BECA6DD90703A016304356B	11	\N	8226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540820180.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJM5TPRN002120819190858480309ZILOGGAME0520NQ6121_0_352BECA6DD90703A016304356B","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25MLN2KW7U1I70HKM","amount":"20180","reference":"D2033625ZNH7S5XLG33G4D5","statusCode":"00","statusMessage":"SUCCESS"}	\N	652
264	14	20000	1396007302706	GIKS	pending	500	Transaksi menggunakan tipe percentage dengan nilai 180	SQ	180	500	2025-10-26 18:33:31.837891	2025-10-26 18:33:34.762778	TXN700952F3	\N	\N	\N	20500	20180	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540820180.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJME6IQ4X02120819190858480309ZILOGGAME0520NQ6121_0_2A07937E2EE0703A01630477CA	11	\N	8226197047	wafiq610@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540820180.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJME6IQ4X02120819190858480309ZILOGGAME0520NQ6121_0_2A07937E2EE0703A01630477CA","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ258ZX6782ELYZFLII","amount":"20180","reference":"D20336255WWUR7FKMADI8SG","statusCode":"00","statusMessage":"SUCCESS"}	\N	652
273	0	15600	838495710prod_official_asia	S****n	success	600	Profit (Role): Rp 600, Duitku Fee : 15600	SQ	140	0	2025-10-30 22:13:36.72705	2025-10-30 17:19:15.599013	TXNE9A3FC89	S****n . Refid: SK2510317LH2FUIRH	RefID=TXNE9A3FC89, TrxID=33, tujuan=838495710prod_official_asia, kode=HSOS60, SUKSES. sn=S****n . Refid: SK2510317LH2FUIRH, harga=15.000, Saldo=41.833 @31/10 00:19:14 * TRX Normal	\N	15000	15740	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540815740.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJNX73OA502120819190858480309ZILOGGAME0520NQ6121_0_91DED23B29C0703A0163043AA3	\N	33	81535485849		{"merchantOrderId":"","Amount":0,"refId":"TXNE9A3FC89","merchantOrderIds":"TXNE9A3FC89","resultCode":"00","signature":""}		1875
276	12	1144	200437971219394	Meilly월	pending	44	Profit (Role): Rp 44, Duitku Fee : 1144	SQ	10	0	2025-11-03 14:46:00.12275	2025-11-03 07:46:07.323253	TXNC6C045B0	\N	\N	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKE4LUOM202120819190858480309ZILOGGAME0520NQ6121_0_D11CCA022510703A016304A66D	\N	\N	081268541912		{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKE4LUOM202120819190858480309ZILOGGAME0520NQ6121_0_D11CCA022510703A016304A66D","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ2558RCT73N5XROPJV","amount":"1154","reference":"D2033625DK4YG5VA26P7EJX","statusCode":"00","statusMessage":"SUCCESS"}		2051
265	12	15600	838495710prod_official_asia	S****n	failed	600	Profit (Role): Rp 600, Duitku Fee : 15600	SQ	140	0	2025-10-29 00:22:35.774117	2025-10-28 17:23:10.99541	TXN64DC20A2	\N	Alamat IP tidak sesuai	\N	15000	15740	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540815740.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJHQ24I8A02120819190858480309ZILOGGAME0520NQ6121_0_B64A9AE57120703A0163042BFC	\N		81535485848		{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540815740.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJHQ24I8A02120819190858480309ZILOGGAME0520NQ6121_0_B64A9AE57120703A0163042BFC","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25E8TCLCHQWRIG35Z","amount":"15740","reference":"D20336254KMH3IZFK5JKXBU","statusCode":"00","statusMessage":"SUCCESS"}		1875
283	12	10504	1670472512837	P-Star7	failed	404	Profit (Role): Rp 404, Duitku Fee : 10504	SQ	94	0	2025-11-06 02:51:06.974963	2025-11-05 19:52:02.514134	TXN13B66F8B		RefID=TXN13B66F8B, TrxID=118, tujuan=1670472512837, kode=MLID33 GAGAL ket=timeout. harga=10.100, Saldo=34.233 @02:52 * TRX Normal	\N	10100	10598	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540810598.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKY952TPI02120819190858480309ZILOGGAME0520NQ6121_0_9AD37F16B790703A0163042CEE	\N	118	81535485848		{"merchantOrderId":"D20336","Amount":10598,"refId":"","merchantOrderIds":"TXN13B66F8B","resultCode":"00","signature":"4eca4fb5df0867f47fd157a3cca38425"}		2052
337	41	11603	838495710prod_official_asia		success	455	Profit (Role): Rp 455, Duitku Fee: 11603	SQ	104	237	2025-11-16 15:34:49.442456	2025-11-16 08:39:05.996081	TXNF5C246B2	S****n . Refid: SK251116IGWI1DK0E8	RefID=TXNF5C246B2, TrxID=191, tujuan=838495710prod_official_asia, kode=HSOS60, SUKSES. sn=S****n . Refid: SK251116IGWI1DK0E8, harga=11385, Saldo=480.889 @16/11 15:38:58 * TRX Normal	\N	11385	11707	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540811707.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKJCZ8QDN02120819190858480309ZILOGGAME0520NQ6121_0_1F374A118B10703A0163046CF9	\N	191	81535485848			NOVEMBERCERIA	1875
266	12	15600	838495710prod_official_asia	S****n	failed	600	Profit (Role): Rp 600, Duitku Fee : 15600	SQ	140	0	2025-10-29 00:25:43.534256	2025-10-28 17:26:48.288278	TXN6598CBB6	\N	status=52&message=: 60 Oneiric Shard HSOS60.838495710prod_official_asia GAGAL. Nomor tujuan salah. Sal 56.833 @00:26 * TRX Normal	\N	15000	15740	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540815740.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJNVRLABD02120819190858480309ZILOGGAME0520NQ6121_0_25403652FBB0703A016304DF5E	\N		081535485848		{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540815740.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJNVRLABD02120819190858480309ZILOGGAME0520NQ6121_0_25403652FBB0703A016304DF5E","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ256XFPT4R8OEOYS1L","amount":"15740","reference":"D2033625ERL1JT60FKAFGLD","statusCode":"00","statusMessage":"SUCCESS"}		1875
277	14	1144	1396007302706	GIKS	failed	44	Profit (Role): Rp 44, Duitku Fee : 1144	SQ	10	0	2025-11-05 03:53:42.033487	2025-11-05 08:00:48.659397	TXND0DFFA62		RefID=TXND0DFFA62, TrxID=111, tujuan=1396007302706, kode=MLID3 GAGAL. ket=. harga=1.100, Saldo=33.133 @15:00 * TRX Normal	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKV1HAEQ502120819190858480309ZILOGGAME0520NQ6121_0_19E672FFE7D0703A0163048B82	\N	111	082226197047	wafiq610@gmail.com	{"merchantOrderId":"D20336","Amount":1154,"refId":"","merchantOrderIds":"TXND0DFFA62","resultCode":"00","signature":"bd80d7c8c100b817e807aa58f2e32799"}		2051
280	29	1144	1396007302706	GIKS	failed	44	Profit (Role): Rp 44, Duitku Fee : 1144	SQ	10	0	2025-11-05 14:57:47.417161	2025-11-05 08:00:48.683803	TXN6C86C8C7		RefID=TXN6C86C8C7, TrxID=114, tujuan=1396007302706, kode=MLID3 GAGAL. ket=. harga=1.100, Saldo=35.333 @15:00 * TRX Normal	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKI2OK4VH02120819190858480309ZILOGGAME0520NQ6121_0_077F1C02B590703A016304F0E5	\N	114	082226197047	wafiq610@gmail.com	{"merchantOrderId":"D20336","Amount":1154,"refId":"","merchantOrderIds":"TXN6C86C8C7","resultCode":"00","signature":"2096eb65f9ad8e5eefd837f92ffcde1b"}		2051
284	12	6760	1035984534855364608		failed	260	Profit (Role): Rp 260, Duitku Fee : 6760	SQ	60	0	2025-11-06 02:58:09.634193	2025-11-05 19:59:02.848492	TXN155D0912		RefID=TXN155D0912, TrxID=119, tujuan=1035984534855364608, kode=FMFCP40 GAGAL ket=timeout. harga=6.500, Saldo=34.233 @02:59 * TRX Normal	\N	6500	6820	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054076820.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK9TGKCM302120819190858480309ZILOGGAME0520NQ6121_0_20D92EFB6010703A016304F35E	\N	119	81535485848		{"merchantOrderId":"D20336","Amount":6820,"refId":"","merchantOrderIds":"TXN155D0912","resultCode":"00","signature":"074d377cb539a69ae87b622cab7e30d0"}		1731
287	0	4069	13791039053		failed	156	Profit (Role): Rp 156, Duitku Fee : 4069	SQ	36	0	2025-11-06 14:58:35.64872	2025-11-06 08:00:05.01652	TXNBE37BE5B		RefID=TXNBE37BE5B, TrxID=123, tujuan=13791039053, kode=FFSG25 GAGAL ket=timeout. harga=3.913, Saldo=34.233 @14:59 * TRX Normal	\N	3913	4105	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054074105.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKJR8TZ3A02120819190858480309ZILOGGAME0520NQ6121_0_63D333C37850703A01630477B6	\N	123	81268541912		{"merchantOrderId":"D20336","Amount":4105,"refId":"","merchantOrderIds":"TXNBE37BE5B","resultCode":"00","signature":"c1d0cfe75a0c8564138596d88be4bfa8"}		1721
267	12	15600	1314123072prod_official_asia		failed	600	Profit (Role): Rp 600, Duitku Fee : 15600	SQ	140	0	2025-10-29 00:30:39.17364	2025-10-28 17:31:04.988353	TXN66C0F513	\N	status=52&message=: 60 Oneiric Shard HSOS60.1314123072prod_official_asia GAGAL. Nomor tujuan salah. Sal 56.833 @00:31 * TRX Normal	\N	15000	15740	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540815740.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJB8QURX002120819190858480309ZILOGGAME0520NQ6121_0_96C35050DFA0703A016304DDD1	\N		081535485848		{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540815740.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJB8QURX002120819190858480309ZILOGGAME0520NQ6121_0_96C35050DFA0703A016304DDD1","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25BKFS1MEK2UE8C4Q","amount":"15740","reference":"D203362552OQ8J0D2RJZZ16","statusCode":"00","statusMessage":"SUCCESS"}		1875
268	12	15600	1314123072prod_official_asia		failed	600	Profit (Role): Rp 600, Duitku Fee : 15600	SQ	140	0	2025-10-29 00:32:05.675946	2025-10-28 17:32:24.33668	TXN671621AA	\N	status=52&message=: 60 Oneiric Shard HSOS60.1314123072prod_official_asia GAGAL. Nomor tujuan salah. Sal 56.833 @00:32 * TRX Normal	\N	15000	15740	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540815740.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJPKMXUW002120819190858480309ZILOGGAME0520NQ6121_0_5F8B033CD480703A016304C2F3	\N		081535485848		{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540815740.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EJPKMXUW002120819190858480309ZILOGGAME0520NQ6121_0_5F8B033CD480703A016304C2F3","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25LOKYPF6L347AB3D","amount":"15740","reference":"D2033625PORA8H331FPUE5J","statusCode":"00","statusMessage":"SUCCESS"}		1875
278	0	1144	1396007302706	GIKS	process	44	Profit (Role): Rp 44, Duitku Fee : 1144	SQ	10	0	2025-11-05 04:08:50.616601	2025-11-04 21:09:21.080313	TXND46CE8B2	\N	status=1&message=RefID=TXND46CE8B2, TrxID=112, tujuan=1396007302706, kode=MLID3 akan diproses @04:09. harga=1.100, Saldo=33.133 * TRX Normal	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKUXGJOC502120819190858480309ZILOGGAME0520NQ6121_0_A3B2FC31AF20703A016304F42E	\N	112	082226197047	wafiq610@gmail.com	{"merchantOrderId":"D20336","Amount":1154,"refId":"","merchantOrderIds":"TXND46CE8B2","resultCode":"00","signature":"4c415a1daa2e2a7eb49d6c4309dd1e8a"}		2051
285	12	1144	1396007302706	GIKS	failed	44	Profit (Role): Rp 44, Duitku Fee : 1144	SQ	10	0	2025-11-06 05:39:58.988435	2025-11-05 22:41:29.29271	TXN3B4A2412		RefID=TXN3B4A2412, TrxID=120, tujuan=1396007302706, kode=MLID3 GAGAL ket=timeout. harga=1.100, Saldo=34.233 @05:41 * TRX Normal	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKOBYTIRP02120819190858480309ZILOGGAME0520NQ6121_0_211C9A834500703A016304464D	\N	120	81535485848	wafiq610@gmail.com	{"merchantOrderId":"D20336","Amount":1154,"refId":"","merchantOrderIds":"TXN3B4A2412","resultCode":"00","signature":"ea4880b700e10d70e7cff7efccdc7935"}		2051
288	12	1144	1396007302706	GIKS	failed	44	Profit (Role): Rp 44, Duitku Fee : 1144	SQ	10	0	2025-11-06 15:15:43.499502	2025-11-06 08:16:33.597856	TXNC23B5A36		RefID=TXNC23B5A36, TrxID=125, tujuan=1396007302706, kode=MLID3 GAGAL ket=timeout. harga=1.100, Saldo=34.233 @15:16 * TRX Normal	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK9QDTFJ402120819190858480309ZILOGGAME0520NQ6121_0_F7B5DF082CA0703A016304112D	\N	125	082226197047	wafiq610@gmail.com	{"merchantOrderId":"D20336","Amount":1154,"refId":"","merchantOrderIds":"TXNC23B5A36","resultCode":"00","signature":"366817b164b6dd6460a4481ac1c01192"}		2051
290	43	13052	1510761030002		pending	502	Profit (Role): Rp 502, Duitku Fee : 13052	SQ	117	0	2025-11-06 15:33:34.866217	2025-11-06 08:33:37.182549	TXNC66AFC81	\N	\N	\N	12550	13169	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540813169.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK8BMHCXL02120819190858480309ZILOGGAME0520NQ6121_0_BB9E3F04FD50703A016304C702	\N	\N	081268541912		{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540813169.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK8BMHCXL02120819190858480309ZILOGGAME0520NQ6121_0_BB9E3F04FD50703A016304C702","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25HO5O7FOKNN8SE1F","amount":"13169","reference":"D2033625YWF7JQYVIZU6DJR","statusCode":"00","statusMessage":"SUCCESS"}		1522
305	12	1144	1396007302706	GIKS	failed	44	Profit (Role): Rp 44	SALDO	0	0	2025-11-07 16:24:53.460061	2025-11-07 09:25:14.938516	TXN23F3F4B9		RefID=TXN23F3F4B9, TrxID=146, tujuan=1396007302706, kode=MLID3 GAGAL ket=timeout. harga=1.100, Saldo=34.233 @16:25 * TRX Normal	\N	1100	1144		\N	146	082226197047	wafiq610@gmail.com			2051
309	12	1664	1396007302706	GIKS	failed	64	Profit (Role): Rp 64	SALDO	0	0	2025-11-07 09:59:12.894791	2025-11-07 09:59:33.373225	TXN2BFE5A06		RefID=TXN2BFE5A06, TrxID=152, tujuan=1396007302706, kode=MLID5 GAGAL ket=timeout. harga=1.600, Saldo=32.391 @16:59 * TRX Normal	\N	1600	1664		\N	152	082226197047	wafiq610@gmail.com			2067
307	43	957	2534745789		success	36	Profit (Role): Rp 36	SALDO	0	0	2025-11-07 16:37:25.56394	2025-11-07 16:37:25.56394	TXN26E317E1	４ｙｏｕＳａｉｔａｍａ? Ref: SK19A5DADC79A1729EF14686E9C	RefID=13551919, TrxID=149, tujuan=2534745789, kode=FFID5, SUKSES. sn=４ｙｏｕＳａｉｔａｍａ? Ref: SK19A5DADC79A1729EF14686E9C, harga=921, Saldo=33.312 @07/11 16:37:41 * TRX Normal	\N	921	957		\N	149	81535485848				1639
313	0	1144	1670472512837	P-Star7	pending	44	Profit (Role): Rp 44, Duitku Fee: 1144	SQ	10	0	2025-11-09 15:34:57.146883	2025-11-09 08:34:59.521382	TXNBB4136EE	\N	\N	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKOKULT5S02120819190858480309ZILOGGAME0520NQ6121_0_AF20F31DF680703A016304D217	\N	\N	81535485848	ragilsevenla7@gmail.com	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKOKULT5S02120819190858480309ZILOGGAME0520NQ6121_0_AF20F31DF680703A016304D217","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ258FFDVMVRVX3QRQG","amount":"1154","reference":"D2033625SMSAEN4JL0IN0XK","statusCode":"00","statusMessage":"SUCCESS"}		2051
367	0	1144	159306967716696	Uzziee	success	44	Profit (Role): Rp 44, Duitku Fee: 1144	SQ	10	0	2025-11-17 15:54:09.624323	2025-11-17 08:55:00.76992	TXN4BCC8959	Uzziee . Refid: SK251117138JROXZJ0	RefID=13661156, TrxID=214, tujuan=159306967716696, kode=MLID3, SUKSES. sn=Uzziee . Refid: SK251117138JROXZJ0, harga=1.100, Saldo=442.863 @17/11 15:55:00 * TRX Normal	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK3H27DTK02120819190858480309ZILOGGAME0520NQ6121_0_5DD10BE16090703A016304E2D9	\N	214	81268541912				2051
338	41	11603	838495710prod_official_asia	S****n	failed	455	Profit (Role): Rp 455, Duitku Fee: 11603	SQ	104	237	2025-11-16 15:44:38.9104	2025-11-16 14:06:57.828111	TXN41A6D010		RefID=TXN41A6D010, TrxID=196, tujuan=838495710prod_official_asia, kode=HSOS60 GAGAL. ket=. harga=11.385, Saldo=464.922 @21:06 * TRX Normal	\N	11385	11707	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540811707.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK87AU5GO02120819190858480309ZILOGGAME0520NQ6121_0_0F7F3B955810703A0163040993	\N	196	81535485848			NOVEMBERCERIA	1875
314	12	1144	1396007302706	GIKS	failed	44	Profit (Role): Rp 44, Duitku Fee: 1144	SQ	10	0	2025-11-09 15:51:48.405007	2025-11-09 09:53:50.878337	TXNBF34E5C3	\N	status=40&message=RefID=TXNBF34E5C3, TrxID=155, tujuan=1396007302706, kode=MLID3 sdh pernah jam 16:13, status Gagal. SN/Ref: . Trx ke-2/hr: MLID3.2.1396007302706.pin. Saldo 32.391 * TRX Normal	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKCRDZ24M02120819190858480309ZILOGGAME0520NQ6121_0_3A29079CE5F0703A01630490BB	\N	155	082226197047	wafiq610@gmail.com	{"merchantOrderId":"","Amount":0,"refId":"","merchantOrderIds":"TXNBF34E5C3","resultCode":"00","signature":""}		2051
339	41	957	7844322195		failed	36	Profit (Role): Rp 36, Duitku Fee: 957	SQ	8	0	2025-11-16 15:47:31.694868	2025-11-16 14:06:57.927109	TXN43610B97		RefID=TXN43610B97, TrxID=198, tujuan=7844322195, kode=FFID5 GAGAL. ket=. harga=921, Saldo=466.764 @21:06 * TRX Normal	\N	921	965	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE5204581653033605406965.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKCKXSWA302120819190858480309ZILOGGAME0520NQ6121_0_AA9B574105F0703A0163044A61	\N	198	81535485848				1639
340	0	124904	1069057057	Tauke✿	pending	4902	Profit (Role): Rp 4902, Duitku Fee: 124904	SQ	1124	2549	2025-11-16 16:56:56.151794	2025-11-16 09:56:56.78874	TXN09029FAF	\N	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE5204581653033605409126028.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKJLI3WP202120819190858480309ZILOGGAME0520NQ6121_0_5ADA996BEEB0703A016304A783","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25QUUBXZOPYG5ZKZY","amount":"126028","reference":"D2033625K4N2WAVC7EVVGU7","statusCode":"00","statusMessage":"SUCCESS"}	\N	122551	126028	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE5204581653033605409126028.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKJLI3WP202120819190858480309ZILOGGAME0520NQ6121_0_5ADA996BEEB0703A016304A783	\N	\N	082226197047	wafiq610@gmail.com		NOVEMBERCERIA	1551
315	12	1144	1396007302706	GIKS	failed	44	Profit (Role): Rp 44, Duitku Fee: 1144	SQ	10	0	2025-11-09 16:54:50.60485	2025-11-09 09:55:38.206397	TXNCDFAFCEF		RefID=TXNCDFAFCEF, TrxID=156, tujuan=1396007302706, kode=MLID3 GAGAL ket=timeout. harga=1.100, Saldo=32.391 @16:55 * TRX Normal	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKH0MDEW602120819190858480309ZILOGGAME0520NQ6121_0_CDF1E2CEA050703A016304C1A1	\N	156	082226197047	wafiq610@gmail.com			2051
341	43	958	7836136516	BTB☂︎IRENGあ	success	37	Profit (Role): Rp 37	SALDO	0	0	2025-11-17 10:07:39.093552	2025-11-17 03:07:42.017011	TXNFA95C898	BTB☂︎IRENGあ Ref: SK19A8FC84DC61783268195F49A	RefID=13657883, TrxID=199, tujuan=7836136516, kode=FFID5, SUKSES. sn=BTB☂︎IRENGあ Ref: SK19A8FC84DC61783268195F49A, harga=921, Saldo=465.843 @17/11 10:07:40 * TRX Normal	\N	921	958		\N	199	81268541912				1639
320	12	1759	8960061148		success	67	Profit (Role): Rp 67, Duitku Fee: 1759	SQ	15	0	2025-11-10 01:37:36.996789	2025-11-09 18:38:52.270704	TXN4881AF94	tejus.gg . Refid: SK2511100M4Y417N1A	RefID=13579233, TrxID=158, tujuan=8960061148, kode=FFID10, SUKSES. sn=tejus.gg . Refid: SK2511100M4Y417N1A, harga=1.692, Saldo=30.699 @10/11 01:38:50 * TRX Normal	\N	1692	1774	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071774.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK45ZKA2N02120819190858480309ZILOGGAME0520NQ6121_0_7F6811EB7CB0703A016304E9C2	\N	158	081535485848				1553
321	12	4680	081535485848		success	180	Profit (Role): Rp 180, Duitku Fee: 4680	SQ	42	0	2025-11-10 01:39:46.493347	2025-11-09 18:40:30.023416	TXN4903AC74	ED6KHVFL33TJJ1D4	RefID=13579234, TrxID=159, tujuan=081535485848, kode=GPIDR5, SUKSES. sn=ED6KHVFL33TJJ1D4, harga=4.500, Saldo=26.199 @10/11 01:40:28 * TRX Normal	\N	4500	4722	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054074722.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKSQNODRK02120819190858480309ZILOGGAME0520NQ6121_0_11106CFB4CD0703A016304A276	\N	159	081535485848				2655
342	43	958	7844322195		failed	37	Profit (Role): Rp 37	SALDO	0	0	2025-11-17 10:12:09.620729	2025-11-17 03:28:26.180381	TXNFBA360DA		RefID=TXNFBA360DA, TrxID=200, tujuan=7844322195, kode=FFID5 GAGAL. ket=. harga=921, Saldo=464.922 @10:28 * TRX Normal	\N	921	958		\N	200	81268541912				1639
324	42	9256	081535485848		success	356	Profit (Role): Rp 356, Duitku Fee: 9256	SQ	83	0	2025-11-10 01:43:50.577168	2025-11-09 18:44:38.811027	TXN49F709F6	KCGGWS82RC0A0ZX0	RefID=13579237, TrxID=160, tujuan=081535485848, kode=GPIDR10, SUKSES. sn=KCGGWS82RC0A0ZX0, harga=8.900, Saldo=17.299 @10/11 01:44:37 * TRX Normal	\N	8900	9339	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054079339.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKJNCYULS02120819190858480309ZILOGGAME0520NQ6121_0_C90C8AEFA300703A01630437D5	\N	160	081535485848				2649
325	12	1144	1396007302706	GIKS	pending	44	Profit (Role): Rp 44, Duitku Fee: 1144	SQ	10	0	2025-11-10 09:12:58.176852	2025-11-10 02:13:00.487987	TXNB33BB66D	\N	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKH495IL802120819190858480309ZILOGGAME0520NQ6121_0_74ACA1CD26B0703A0163046AE0","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ25U0W6JE5RMVEUGAD","amount":"1154","reference":"D2033625Y81OMSYMMRRGYNB","statusCode":"00","statusMessage":"SUCCESS"}	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKH495IL802120819190858480309ZILOGGAME0520NQ6121_0_74ACA1CD26B0703A0163046AE0	\N	\N	082226197047	wafiq610@gmail.com			2051
343	43	958	7844322195		failed	37	Profit (Role): Rp 37	SALDO	0	0	2025-11-17 10:23:49.311363	2025-11-17 03:28:27.754915	TXNFE5F6031		RefID=TXNFE5F6031, TrxID=201, tujuan=7844322195, kode=FFID5 GAGAL. ket=. harga=921, Saldo=465.843 @10:28 * TRX Normal	\N	921	958		\N	201	81268541912				1639
326	12	1144	1396007302706	GIKS	pending	44	Profit (Role): Rp 44, Duitku Fee: 1144	SQ	10	0	2025-11-10 12:32:48.120579	2025-11-10 05:32:49.460596	TXNE2110392	\N	{"status":"","code":"","message":"","qrString":"00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK20DAVMC02120819190858480309ZILOGGAME0520NQ6121_0_4FD082F2C500703A0163041D30","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SQ252J6NNA1F1BEHFBE","amount":"1154","reference":"D20336257V3TGQMQPL6PX8W","statusCode":"00","statusMessage":"SUCCESS"}	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK20DAVMC02120819190858480309ZILOGGAME0520NQ6121_0_4FD082F2C500703A0163041D30	\N	\N	082226197047	wafiq610@gmail.com			2051
345	43	958	2286339336	—alwys'ikyy★	success	37	Profit (Role): Rp 37	SALDO	0	0	2025-11-17 10:48:57.252927	2025-11-17 03:49:00.740404	TXN0444D210	—alwys'ikyy★ . Refid: SK251117H04HYBINJV	RefID=13658264, TrxID=202, tujuan=2286339336, kode=FFID5, SUKSES. sn=—alwys'ikyy★ . Refid: SK251117H04HYBINJV, harga=921, Saldo=464.922 @17/11 10:48:59 * TRX Normal	\N	921	958		\N	202	81268541912				1639
328	12	1144	1396007302706	GIKS	failed	44	Profit (Role): Rp 44	SALDO	0	0	2025-11-10 12:37:08.113294	2025-11-10 05:37:29.032079	TXNE315B408		RefID=TXNE315B408, TrxID=173, tujuan=1396007302706, kode=MLID3 GAGAL ket=timeout. harga=1.100, Saldo=17.299 @12:37 * TRX Normal	\N	1100	1144		\N	173	082226197047	wafiq610@gmail.com			2051
331	12	1144	1396007302706	GIKS	success	44	Profit (Role): Rp 44	SALDO	0	0	2025-11-10 13:11:16.740515	2025-11-10 06:11:19.752976	TXNEB15A478	GIKS . Refid: SK251110LF9GX70YZU	RefID=13583381, TrxID=176, tujuan=1396007302706, kode=MLID3, SUKSES. sn=GIKS . Refid: SK251110LF9GX70YZU, harga=1.100, Saldo=13.999 @10/11 13:11:12 * TRX Normal	\N	1100	1144		\N	176	081535485848	wafiq610@gmail.com			2051
352	12	14690	81002594938	ZaharaRahmi	success	565	Profit (Role): Rp 565	SALDO	0	0	2025-11-17 10:59:39.813792	2025-11-17 03:59:42.138919	TXN06C60B7C	81002594938 . Refid: SK2511177F2N0A3KA2	RefID=13658365, TrxID=207, tujuan=81002594938, kode=LDCR60, SUKSES. sn=81002594938 . Refid: SK2511177F2N0A3KA2, harga=14.125, Saldo=446.576 @17/11 10:59:41 * TRX Normal	\N	14125	14690		\N	207	81535485848				2191
353	0	958	6277151942	Refi3413L	pending	37	Profit (Role): Rp 37, Duitku Fee: 16	DA	2007	0	2025-11-17 11:04:36.38319	2025-11-17 11:04:36.38319	TXN07EF267A	\N	\N	\N	921	2965		\N	\N	81268541912				1639
354	12	958	13864595438	NEXUDHDJ	pending	37	Profit (Role): Rp 37, Duitku Fee: 16	DA	2007	0	2025-11-17 11:06:51.625536	2025-11-17 11:06:51.625536	TXN0876C02F	\N	\N	\N	921	2965		\N	\N	81535485848				1639
355	0	958	609868268	MCxNayaヅ	pending	37	Profit (Role): Rp 37, Duitku Fee: 16	DA	2007	0	2025-11-17 11:07:20.171232	2025-11-17 11:07:20.171232	TXN0893E791	\N	\N	\N	921	2965		\N	\N	81268541912				1639
356	0	18712	13864595438	NEXUDHDJ	pending	720	Profit (Role): Rp 720, Duitku Fee: 312	DA	2131	0	2025-11-17 11:08:30.913626	2025-11-17 11:08:30.913626	TXN08D949DC	\N	\N	\N	17992	20843		\N	\N	81535485848				1576
357	0	23028	13864595438	NEXUDHDJ	pending	886	Profit (Role): Rp 886, Duitku Fee: 385	OV	1758	0	2025-11-17 11:08:55.777392	2025-11-17 04:08:55.992502	TXN08F28837	\N	{"status":"","code":"","message":"","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=OV25JLT0X830EM4485D","amount":"24786","reference":"D2033625WEDNVGHCZEL0E0X","statusCode":"00","statusMessage":"SUCCESS"}	\N	22142	24786	https://passport.duitku.com/topup/topupdirectv2.aspx?ref=OV25JLT0X830EM4485D	\N	\N	081535485848				1582
359	0	1760	13864595438	NEXUDHDJ	pending	68	Profit (Role): Rp 68, Duitku Fee: 29	OV	1520	0	2025-11-17 11:09:46.520125	2025-11-17 04:09:46.69182	TXN09259262	\N	{"status":"","code":"","message":"","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=OV25VHMLEBJGMLSHJQI","amount":"3280","reference":"D2033625CUAZ18EMSHWWMLZ","statusCode":"00","statusMessage":"SUCCESS"}	\N	1692	3280	https://passport.duitku.com/topup/topupdirectv2.aspx?ref=OV25VHMLEBJGMLSHJQI	\N	\N	081535485848				1553
358	0	958	609868268	MCxNayaヅ	success	37	Profit (Role): Rp 37, Duitku Fee: 958	SQ	9	0	2025-11-17 11:09:11.535941	2025-11-17 04:09:54.261003	TXN09022B07	MCxNayaヅ . Refid: SK2511179WMLMZ4N34	RefID=13658466, TrxID=208, tujuan=609868268, kode=FFID5, SUKSES. sn=MCxNayaヅ . Refid: SK2511179WMLMZ4N34, harga=921, Saldo=445.655 @17/11 11:09:53 * TRX Normal	\N	921	967	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE5204581653033605406967.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKRLADTJ702120819190858480309ZILOGGAME0520NQ6121_0_C23ED87CB180703A01630438F0	\N	208	81268541912				1639
360	0	1760	13864595438	NEXUDHDJ	pending	68	Profit (Role): Rp 68, Duitku Fee: 2500	FT	3014	0	2025-11-17 11:10:16.337894	2025-11-17 11:10:16.337894	TXN094324C5	\N	\N	\N	1692	4774		\N	\N	081535485848				1553
362	0	12641	6145403326	Nisadir2038E	pending	486	Profit (Role): Rp 486, Duitku Fee: 253	SA	215	0	2025-11-17 11:11:40.667437	2025-11-17 04:11:41.170051	TXN09979A9F	\N	{"status":"","code":"","message":"","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SA25JQIK2MARJW4VY4Q","amount":"12856","reference":"D2033625ZKWW5I3QSUMOUQX","statusCode":"00","statusMessage":"SUCCESS"}	\N	12155	12856	https://passport.duitku.com/topup/topupdirectv2.aspx?ref=SA25JQIK2MARJW4VY4Q	\N	\N	081535485848				1689
363	0	12641	6145403326	Nisadir2038E	pending	486	Profit (Role): Rp 486, Duitku Fee: 3000	BR	2588	0	2025-11-17 11:12:17.436634	2025-11-17 04:12:17.639723	TXN09BC8F8D	\N	{"status":"","code":"","message":"","vaNumber":"1308300280265889","paymentUrl":"https://passport.duitku.com/topup/topupdirectv2.aspx?ref=BR25YRQIN8MQ0XF170Z","amount":"15229","reference":"D20336253200N0J1OYTCPZX","statusCode":"00","statusMessage":"SUCCESS"}	\N	12155	15229	1308300280265889	\N	\N	081535485848				1689
361	0	958	609868268	MCxNayaヅ	failed	37	Profit (Role): Rp 37, Duitku Fee: 16	OV	1511	0	2025-11-17 11:11:27.009749	2025-11-17 04:13:06.044785	TXN098906DE	\N	{"merchantOrderId":"D20336","Amount":2469,"refId":"","merchantOrderIds":"TXN098906DE","resultCode":"01","signature":"e5026a0856a61c2775a55810604b6629"}	\N	921	2469	https://passport.duitku.com/topup/topupdirectv2.aspx?ref=OV252JA8U414KICWTJF	\N	\N	81268541912		Transaksi gagal, silahkan hubungi admin untuk bantuan		1639
329	12	1144	1396007302706	GIKS	success	44	Profit (Role): Rp 44, Duitku Fee: 1144	SQ	10	0	2025-11-10 12:56:38.671757	2025-11-10 05:57:19.076492	TXNE7A78780	GIKS . Refid: SK251110431GLPM0SQ	RefID=13583278, TrxID=174, tujuan=1396007302706, kode=MLID3, SUKSES. sn=GIKS . Refid: SK251110431GLPM0SQ, harga=1.100, Saldo=16.199 @10/11 12:57:12 * TRX Normal	\N	1100	1154	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054071154.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK2KF93Y702120819190858480309ZILOGGAME0520NQ6121_0_81B3BFB069D0703A016304208E	\N	174	082226197047	wafiq610@gmail.com			2051
348	43	1144	159306967716696	Uzziee	success	44	Profit (Role): Rp 44	SALDO	0	0	2025-11-17 10:54:15.048133	2025-11-17 03:54:21.775279	TXN0582A920	Uzziee . Refid: SK251117NX97QC9ZWW	RefID=13658315, TrxID=203, tujuan=159306967716696, kode=MLID3, SUKSES. sn=Uzziee . Refid: SK251117NX97QC9ZWW, harga=1.100, Saldo=463.822 @17/11 10:54:20 * TRX Normal	\N	1100	1144		\N	203	81268541912				2051
330	12	1144	1396007302706	GIKS	success	44	Profit (Role): Rp 44	SALDO	0	0	2025-11-10 13:02:40.322658	2025-11-10 06:02:42.326392	TXNE9110558	GIKS . Refid: SK251110VNMPR06L6U	RefID=13583312, TrxID=175, tujuan=1396007302706, kode=MLID3, SUKSES. sn=GIKS . Refid: SK251110VNMPR06L6U, harga=1.100, Saldo=15.099 @10/11 13:02:35 * TRX Normal	\N	1100	1144		\N	175	082226197047	wafiq610@gmail.com			2051
349	12	1144	1362276372678	ᶯᵒᶷᵛᵒ	success	44	Profit (Role): Rp 44	SALDO	0	0	2025-11-17 10:56:24.581021	2025-11-17 03:56:27.770706	TXN0603AEF6	ᶯᵒᶷᵛᵒ . Refid: SK251117JE1SI6ZIEA	RefID=13658335, TrxID=204, tujuan=1362276372678, kode=MLID3, SUKSES. sn=ᶯᵒᶷᵛᵒ . Refid: SK251117JE1SI6ZIEA, harga=1.100, Saldo=462.722 @17/11 10:56:26 * TRX Normal	\N	1100	1144		\N	204	81535485848				2051
350	12	1144	1362276372678	ᶯᵒᶷᵛᵒ	success	44	Profit (Role): Rp 44	SALDO	0	0	2025-11-17 10:57:49.694474	2025-11-17 03:57:53.839182	TXN06585287	ᶯᵒᶷᵛᵒ . Refid: SK2511174LMXI5BUX4	RefID=13658349, TrxID=205, tujuan=1362276372678, kode=MLID3, SUKSES. sn=ᶯᵒᶷᵛᵒ . Refid: SK2511174LMXI5BUX4, harga=1.100, Saldo=461.622 @17/11 10:57:52 * TRX Normal	\N	1100	1144		\N	205	81535485848				2051
351	12	958	609868268	MCxNayaヅ	success	37	Profit (Role): Rp 37	SALDO	0	0	2025-11-17 10:58:32.464372	2025-11-17 03:58:34.320072	TXN0683F81D	MCxNayaヅ . Refid: SK251117AJA6Q9LP7J	RefID=13658354, TrxID=206, tujuan=609868268, kode=FFID5, SUKSES. sn=MCxNayaヅ . Refid: SK251117AJA6Q9LP7J, harga=921, Saldo=460.701 @17/11 10:58:33 * TRX Normal	\N	921	958		\N	206	81535485848				1639
365	0	958	7844322195	gunaro12345	failed	37	Profit (Role): Rp 37, Duitku Fee: 958	SQ	9	0	2025-11-17 11:15:41.736274	2025-11-17 04:18:08.420345	TXN0A884A54		RefID=TXN0A884A54, TrxID=209, tujuan=7844322195, kode=FFID5 GAGAL. ket=. harga=921, Saldo=443.963 @11:18 * TRX Normal	\N	921	967	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE5204581653033605406967.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKI3UB45002120819190858480309ZILOGGAME0520NQ6121_0_D26C3D0C6410703A01630498B4	\N	209	81268541912				1639
333	0	14690	81002594938	ZaharaRahmi	success	565	Profit (Role): Rp 565, Duitku Fee: 14690	SQ	132	0	2025-11-16 13:57:05.9477	2025-11-16 13:10:06.638064	TXN3643410E	81002594938 . Refid: SK251116I5FOSEUW1I	RefID=13653908, TrxID=192, tujuan=81002594938, kode=LDCR60, SUKSES. sn=81002594938 . Refid: SK251116I5FOSEUW1I, harga=14.125, Saldo=466.764 @16/11 20:09:55 * TRX Normal	\N	14125	14822	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE520458165303360540814822.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKOXZ7RHL02120819190858480309ZILOGGAME0520NQ6121_0_6CEA3172E740703A01630408DA	\N	192	81535485848				2191
364	0	1760	609868268	MCxNayaヅ	success	68	Profit (Role): Rp 68, Duitku Fee: 29	OV	1520	0	2025-11-17 11:15:06.764464	2025-11-17 04:16:12.35833	TXN0A65A235	MCxNayaヅ . Refid: SK251117WS3HIKO0YM	RefID=13658506, TrxID=210, tujuan=609868268, kode=FFID10, SUKSES. sn=MCxNayaヅ . Refid: SK251117WS3HIKO0YM, harga=1.692, Saldo=443.042 @17/11 11:16:11 * TRX Normal	\N	1692	3280	https://passport.duitku.com/topup/topupdirectv2.aspx?ref=OV25AXVU53KR3W3G55T	\N	210	081535485848				1553
334	0	6760	1035984534855364608	Satyr	failed	260	Profit (Role): Rp 260, Duitku Fee: 6760	SQ	60	0	2025-11-16 14:01:27.303696	2025-11-16 13:01:28.905257	TXNDFE0C4C3		status=40&message=RefID=TXNDFE0C4C3, TrxID=189, tujuan=1035984534855364608, kode=FMFCP40 sdh pernah jam 14:11, status Gagal. SN/Ref: . Trx ke-2/hr: FMFCP40.2.1035984534855364608.pin. Saldo 480.889 * TRX Normal	\N	6500	6820	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054076820.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EKDNVR13K02120819190858480309ZILOGGAME0520NQ6121_0_1D2E9A6F36B0703A0163048AFE	\N	189	81535485848				1731
335	41	6760	1035984534855364608	RealMadrid	success	260	Profit (Role): Rp 260, Duitku Fee: 6760	SQ	60	0	2025-11-16 14:52:35.895406	2025-11-16 12:54:09.712865	TXNEBDC6534	RealMadrid . Refid: SK251116ZWVRADM7KU	{"merchantOrderId":"","Amount":0,"refId":"TXNEBDC6534","merchantOrderIds":"TXNEBDC6534","resultCode":"00","signature":""}	\N	6500	6820	00020101021226580017ID.CO.NUSAPAY.WWW0118936008360000002405020424050303UKE51360017ID.CO.NUSAPAY.WWW020424050303UKE52045816530336054076820.005802ID5910ZILOG GAME6015JAKARTA SELATAN610512520627401100EK18RVN0T02120819190858480309ZILOGGAME0520NQ6121_0_5CA660024650703A016304A70F	\N	190	81535485848				1731
\.


--
-- Data for Name: user_balance_logs; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.user_balance_logs (id, user_id, transaction_type, amount, balance_before, balance_after, reference_id, reference_type, description, created_at, created_by) FROM stdin;
1	14	refund	8335.00	5271.00	13606.00	TXN68D35B8332970CF6	callback_refund	Balance refund of 8335	2025-09-24 02:47:02.042154	\N
2	14	refund	8335.00	13606.00	21941.00	TXN68D35CBBE1FE2808	callback_refund	Balance refund of 8335	2025-09-24 02:51:59.037497	\N
3	12	refund	8335.00	0.00	8335.00	TXN68D36D71BCC3AAA0	callback_refund	Balance refund of 8335	2025-09-24 04:10:23.044921	\N
4	14	refund	29965.00	21941.00	51906.00	RS141758697275391518200	callback_refund	Balance refund of 29965	2025-09-24 07:07:07.62835	\N
5	14	refund	10236.00	51906.00	62142.00	RS141758697118647322000	callback_refund	Balance refund of 10236	2025-09-24 07:09:38.25966	\N
7	13	refund	5757.00	0.00	5757.00	TXN68D68C99FF0D2A85	callback_refund	Balance refund of 5757	2025-09-26 12:53:17.249902	\N
8	12	refund	7861.00	8335.00	16196.00	TXN68D74B427F99F18F	callback_refund	Balance refund of 7861	2025-09-27 02:26:26.050322	\N
9	12	refund	7861.00	16196.00	24057.00	TXN68D751F3FEC8AACF	callback_refund	Balance refund of 7861	2025-09-27 02:55:10.643873	\N
10	12	refund	7861.00	24057.00	31918.00	TXN68D77B2D72570B71	callback_refund	Balance refund of 7861	2025-09-27 05:51:18.680629	\N
11	12	refund	7861.00	31918.00	39779.00	TXN68D77BCCB228EAB3	callback_refund	Balance refund of 7861	2025-09-27 05:53:36.833613	\N
12	12	refund	75288.00	39779.00	115067.00	RS121758952759242471377	callback_refund	Balance refund of 75288	2025-09-27 05:59:42.212817	\N
13	12	refund	14983.00	115067.00	130050.00	RS121758954048707808078	callback_refund	Balance refund of 14983	2025-09-27 06:21:13.175349	\N
14	12	refund	30041.00	130050.00	160091.00	TXN68DCD8401FE14AC7	callback_refund	Balance refund of 30041	2025-10-01 07:32:08.575591	\N
15	12	refund	10375.00	160091.00	170466.00	TXN68DCE69FCA310914	callback_refund	Balance refund of 10375	2025-10-01 08:30:42.032608	\N
16	14	refund	15992.00	62142.00	78134.00	RS141759485587274442000	callback_refund	Balance refund of 15992	2025-10-03 10:00:46.932852	\N
17	14	refund	361189.00	78134.00	439323.00	RS141759494860666881483	callback_refund	Balance refund of 361189	2025-10-03 12:35:04.957174	\N
18	14	refund	134441.00	439323.00	573764.00	RS141759557224343935300	callback_refund	Balance refund of 134441	2025-10-04 05:54:23.347914	\N
19	27	refund	2215.00	0.00	2215.00	TXN186FC30E708BC85B23D94B3E5AD2DCA6	callback_refund	Balance refund of 2215	2025-10-19 02:21:53.032961	\N
20	12	refund	15600.00	170466.00	186066.00	TXNB50A4654	callback_refund	Balance refund of 15600	2025-10-23 15:39:51.587607	\N
21	12	refund	15600.00	186066.00	201666.00	TXNB723B20B	callback_refund	Balance refund of 15600	2025-10-23 15:48:14.931509	\N
22	12	refund	15600.00	201666.00	217266.00	TXNB723B20B	callback_refund	Balance refund of 15600	2025-10-23 15:51:07.895474	\N
23	12	refund	15600.00	217266.00	232866.00	TXNB723B20B	callback_refund	Balance refund of 15600	2025-10-23 15:51:49.843832	\N
24	12	refund	15600.00	232866.00	248466.00	TXNB723B20B	callback_refund	Balance refund of 15600	2025-10-23 15:52:37.539606	\N
25	12	refund	1139.00	248466.00	249605.00	TXNB8420657	callback_refund	Balance refund of 1139	2025-10-23 15:53:07.534778	\N
26	12	refund	15600.00	249605.00	265205.00	TXNB723B20B	callback_refund	Balance refund of 15600	2025-10-23 15:53:21.994881	\N
27	12	refund	15600.00	265205.00	280805.00	TXNB723B20B	callback_refund	Balance refund of 15600	2025-10-23 15:55:17.6999	\N
28	12	refund	1139.00	280805.00	281944.00	TXNB8420657	callback_refund	Balance refund of 1139	2025-10-23 15:55:30.825047	\N
29	12	refund	15600.00	281944.00	297544.00	TXNB723B20B	callback_refund	Balance refund of 15600	2025-10-23 16:00:12.346949	\N
30	12	refund	15600.00	297544.00	313144.00	TXNB723B20B	callback_refund	Balance refund of 15600	2025-10-23 16:01:08.263154	\N
31	12	refund	15600.00	313144.00	328744.00	TXNB723B20B	callback_refund	Balance refund of 15600	2025-10-23 16:06:48.050291	\N
32	12	refund	15600.00	328744.00	344344.00	TXN64DC20A2	callback_refund	Balance refund of 15600	2025-10-28 17:23:10.99541	\N
33	12	refund	15600.00	344344.00	359944.00	TXN6598CBB6	callback_refund	Balance refund of 15600	2025-10-28 17:26:48.288278	\N
34	12	refund	15600.00	359944.00	375544.00	TXN66C0F513	callback_refund	Balance refund of 15600	2025-10-28 17:31:04.988353	\N
35	12	refund	15600.00	375544.00	391144.00	TXN671621AA	callback_refund	Balance refund of 15600	2025-10-28 17:32:24.33668	\N
36	12	refund	18720.00	391144.00	409864.00	TXNFD689103	callback_refund	Balance refund of 18720	2025-10-29 04:14:00.556288	\N
37	28	refund	4309.00	0.00	4309.00	RS281761744431638560952	callback_refund	Balance refund of 4309	2025-10-29 13:28:19.281071	\N
38	28	refund	4309.00	4309.00	8618.00	RS281761747288372418373	callback_refund	Balance refund of 4309	2025-10-29 14:17:37.551582	\N
39	28	refund	4309.00	8618.00	12927.00	RS281761747288372418373	callback_refund	Balance refund of 4309	2025-10-29 14:41:07.774307	\N
40	28	refund	1000.00	12927.00	13927.00	RS281761803683838281300	callback_refund	Balance refund of 1000	2025-10-30 05:55:34.90268	\N
41	28	refund	1000.00	13927.00	14927.00	RS281761803683838281300	callback_refund	Balance refund of 1000	2025-10-30 05:59:49.255425	\N
42	28	refund	1000.00	14927.00	15927.00	RS281761803683838281300	callback_refund	Balance refund of 1000	2025-10-30 06:03:06.13737	\N
43	28	refund	1000.00	15927.00	16927.00	RS281761803683838281300	callback_refund	Balance refund of 1000	2025-10-30 06:04:56.683379	\N
44	28	refund	1000.00	16927.00	17927.00	RS281761803683838281300	callback_refund	Balance refund of 1000	2025-10-30 06:13:33.464605	\N
45	28	refund	1000.00	17927.00	18927.00	RS281761803683838281300	callback_refund	Balance refund of 1000	2025-10-30 06:25:29.907183	\N
46	28	refund	1000.00	18927.00	19927.00	RS281761803683838281300	callback_refund	Balance refund of 1000	2025-10-30 06:32:55.131488	\N
47	28	refund	1000.00	19927.00	20927.00	RS281761803683838281300	callback_refund	Balance refund of 1000	2025-10-30 06:44:22.867724	\N
48	14	refund	100000.00	573764.00	673764.00	TXN8753C746	callback_refund	Balance refund of 100000	2025-10-30 09:03:36.426528	\N
49	14	refund	100000.00	673764.00	773764.00	TXN8753C746	callback_refund	Balance refund of 100000	2025-10-30 09:05:35.74297	\N
50	14	refund	100000.00	773764.00	873764.00	TXN8753C746	callback_refund	Balance refund of 100000	2025-10-30 09:05:36.720434	\N
51	14	refund	1144.00	873764.00	874908.00	TXND0DFFA62	callback_refund	Balance refund of 1144	2025-11-05 08:00:48.659397	\N
52	29	refund	1144.00	0.00	1144.00	TXN6C86C8C7	callback_refund	Balance refund of 1144	2025-11-05 08:00:48.683803	\N
53	12	refund	1144.00	409864.00	411008.00	TXN72E88081	callback_refund	Balance refund of 1144	2025-11-05 08:36:56.26944	\N
54	12	refund	10504.00	411008.00	421512.00	TXN13B66F8B	callback_refund	Balance refund of 10504	2025-11-05 19:52:02.514134	\N
55	12	refund	6760.00	421512.00	428272.00	TXN155D0912	callback_refund	Balance refund of 6760	2025-11-05 19:59:02.848492	\N
56	12	refund	1144.00	428272.00	429416.00	TXN3B4A2412	callback_refund	Balance refund of 1144	2025-11-05 22:41:29.29271	\N
57	12	refund	1144.00	429416.00	430560.00	TXNC23B5A36	callback_refund	Balance refund of 1144	2025-11-06 08:16:33.597856	\N
58	12	refund	1144.00	425984.00	427128.00	TXN27A99D12	callback_refund	Balance refund of 1144	2025-11-06 15:28:50.22604	\N
59	12	refund	1144.00	425984.00	427128.00	TXN23F3F4B9	callback_refund	Balance refund of 1144	2025-11-07 09:25:14.938516	\N
60	43	refund	957.00	3112.00	4069.00	TXN26881DA1	callback_refund	Balance refund of 957	2025-11-07 09:36:14.84645	\N
61	43	refund	957.00	3112.00	4069.00	TXN26E317E1	callback_refund	Balance refund of 957	2025-11-07 09:37:41.962985	\N
62	12	refund	1144.00	422656.00	423800.00	TXNBF34E5C3	callback_refund	Balance refund of 1144	2025-11-09 09:53:50.878337	\N
63	12	refund	1144.00	423800.00	424944.00	TXNCDFAFCEF	callback_refund	Balance refund of 1144	2025-11-09 09:55:38.206397	\N
64	12	refund	1759.00	424944.00	426703.00	TXN4881AF94	callback_refund	Balance refund of 1759	2025-11-09 18:38:36.39509	\N
65	12	refund	1759.00	426703.00	428462.00	TXN4881AF94	callback_refund	Balance refund of 1759	2025-11-09 18:38:52.270704	\N
66	12	refund	4680.00	428462.00	433142.00	TXN4903AC74	callback_refund	Balance refund of 4680	2025-11-09 18:40:30.023416	\N
67	42	refund	9256.00	1144.00	10400.00	TXN49F709F6	callback_refund	Balance refund of 9256	2025-11-09 18:44:38.811027	\N
68	12	refund	1144.00	431998.00	433142.00	TXNE315B408	callback_refund	Balance refund of 1144	2025-11-10 05:37:29.032079	\N
69	28	refund	5309.00	1191.00	6500.00	TXN3E57CB5C	callback_refund	Balance refund of 5309	2025-11-16 13:44:29.874379	\N
70	28	refund	5309.00	6500.00	11809.00	TXN3E57CB5C	callback_refund	Balance refund of 5309	2025-11-16 13:44:29.874379	\N
71	41	refund	11603.00	0.00	11603.00	TXN41A6D010	callback_refund	Balance refund of 11603	2025-11-16 14:06:57.828111	\N
72	41	refund	957.00	11603.00	12560.00	TXN43610B97	callback_refund	Balance refund of 957	2025-11-16 14:06:57.927109	\N
73	43	refund	958.00	238.00	1196.00	TXNFBA360DA	callback_refund	Balance refund of 958	2025-11-17 03:28:26.180381	\N
74	43	refund	958.00	1196.00	2154.00	TXNFE5F6031	callback_refund	Balance refund of 958	2025-11-17 03:28:27.754915	\N
\.


--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.user_sessions (id, user_id, branch_id, domain, ip_address, user_agent, expires_at, is_active, created_at, last_activity, session_token) FROM stdin;
NDE6MToxNzYzMjgxNzc4Ojc0OTJkODk2	41	1	172.18.0.1	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	2025-11-17 08:29:38.670782	t	2025-11-16 08:29:38.554703	2025-11-16 08:29:38.554703	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJicmFuY2hJRCI6MSwiZXhwIjoxNzYzMzY4MTc4LCJpYXQiOjE3NjMyODE3NzgsInJvbGVJRCI6Mywic2Vzc2lvbklEIjoiTkRFNk1Ub3hOell6TWpneE56YzRPamMwT1RKa09EazIiLCJ1c2VySUQiOjQxfQ.zXegQVy1fKXHZPsu0gePY-Wo07tpiGWNjmoNcD1WLxY
MTI6MToxNzYzMzY5Mzk4OjllYWQ0ZTIx	12	1	172.18.0.1	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	2025-11-18 08:49:58.583834	t	2025-11-17 08:49:58.431559	2025-11-17 08:49:58.431559	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJicmFuY2hJRCI6MSwiZXhwIjoxNzYzNDU1Nzk4LCJpYXQiOjE3NjMzNjkzOTgsInJvbGVJRCI6MSwic2Vzc2lvbklEIjoiTVRJNk1Ub3hOell6TXpZNU16azRPamxsWVdRMFpUSXgiLCJ1c2VySUQiOjEyfQ.2yPTf4741sbGLWXpZX4EYO0w4if4Q2zi3CpoznNgxVA
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.users (id, username, email, password_hash, full_name, role_id, branch_id, is_active, last_login, created_at, updated_at, is_deleted, balance, phone_number) FROM stdin;
39	testingotpBF84	testingotpBF84@gmail.com	$2a$04$R1NbpB4J5d3JOuQxjmxiM.XnxtusR3gVXxZllNPdHVUSnu83txUL6	\N	3	1	t	\N	2025-11-05 13:51:53.809999	2025-11-05 13:51:53.809999	f	1144	082226197047
48	nada3443	nada3443@gmail.com	$2a$04$4qQtY2.y.Wx0wiO2IEDF4OGlt6YW0XN6Dfmn3F9YzeTKKI/pqFMiC	\N	3	1	t	\N	2025-11-16 13:01:28.905257	2025-11-16 13:01:28.905257	f	6760	81535485848
28	ghipari	ghipari@gmail.com	$2a$10$aXS.hqEE/O2Ul7c18pBk0OgmVB5xWcCcO0cgqzm7LvlRImzuiU4wa	\N	1	6	t	\N	2025-10-27 02:10:36.316348	2025-11-16 13:44:29.874379	f	11809	+6282226197047
40	wafiuddinC061	wafiuddinC061@gmail.com	$2a$04$LCgqjEBeQyKSlYaM0.n1L.ooT8uaFMeFufnZMq.ioiZXCQfNzXdRy	\N	3	1	t	\N	2025-11-05 13:55:34.712944	2025-11-05 13:55:34.712944	f	1144	081233754846
29	adminajatest	wafiwafiwafi90uu@gmail.com	$2a$10$2kPmpce5pXCc5IMu4Jtqb.nbaxssnOskwGRi.fHVu5khjO6uS/LDK	\N	2	2	f	\N	2025-10-27 13:48:22.303787	2025-11-05 08:00:48.683803	f	1144	+6282226197047
41	Ragilr7x	ragilsevenla7@gmail.com	$2a$10$caGVHgJ8mu0MRSvGT0y0ru2J9XOPsJ1kNKE6TYGIEybIpfBfYvgA2	\N	3	1	t	\N	2025-11-05 19:54:42.871572	2025-11-16 14:06:57.927109	f	12560	081535485848
49	adminkedua	adminkedua@gmail.com	$2a$10$18StZdrSi9biWE7lCjAKA.Ws4fHcNtutqst9Yuftz2Kg/bLeK7f6W	\N	1	1	t	\N	2025-11-16 14:07:17.787218	2025-11-16 14:07:17.787218	f	0	082226197047
43	adminBA2CBC48BE91	adminBA2CBC48BE91@gmail.com	$2a$04$JCYJjHb0trL5ozkhKXTPNuI3UuuDE0vix9dwJN.jrUh9nbXCalA.6	\N	3	1	f	\N	2025-11-06 08:00:05.01652	2025-11-17 03:54:15.142878	f	52	81268541912
47	adminBA2CBC48BE91ECE7	adminBA2CBC48BE91ECE7@gmail.com	$2a$04$fUeBKIPbfuUafQUm.zHq9uK0UvNccxfkPPwgMbLWxTfriyQRrP7.K	\N	3	1	t	\N	2025-11-16 07:57:02.197111	2025-11-16 07:57:02.197111	f	6760	81535485848
12	test24	test24@gmail.com	$2a$10$fWIZQVVFzBQkyoRed6jNRegQeEsdNnKhkuk/6D7cbQ5I5liBz1Jx2	\N	1	1	t	\N	2025-09-14 08:36:26.088424	2025-11-17 03:59:39.905536	f	411774	+6282226197047
50	admin90230B1B	admin90230B1B@gmail.com	$2a$04$1rnGZT.ANq/zOlW0sHWb0uhHAowaVTXaOpMGHCGYOjAKa1PPHq6U6	\N	3	1	t	\N	2025-11-17 04:18:08.420345	2025-11-17 04:18:08.420345	f	958	81268541912
7	nada	nada@gmail.com	$2a$10$vwSEh42FTQ/z9z.LvjbKse4VoDn38VVsDVPIjEAG8ifPzrc2K5Gha	\N	2	1	f	\N	2025-09-14 08:27:51.849926	2025-09-14 08:27:51.849926	f	0	+6282226197047
21	admin9023	admin9023@gmail.com	$2a$10$21fsPDKUDcYBLgOc4AzD0Oz3IIT7YEUst2J4Zbisjauj1u7aNDqcG	\N	2	5	t	\N	2025-09-30 09:53:57.89456	2025-09-30 09:53:57.89456	f	0	+6282226197047
2	wafiuddin	wafiq610@gmail.com	$2a$10$18StZdrSi9biWE7lCjAKA.Ws4fHcNtutqst9Yuftz2Kg/bLeK7f6W	\N	1	1	t	\N	2025-09-14 08:23:43.808052	2025-10-10 13:40:07.704378	f	0	+6282226197047
27	admin100a	admin100a@gmail.com	$2a$10$C6NNZ9b.dP5YEPSiv3F9Vur0mkPwuCHUIDexRABU6Qa1TiEjOFjPu	\N	1	1	t	\N	2025-10-19 02:12:08.663925	2025-10-19 02:21:53.032961	f	2215	+6282226197047
14	localdev	localdev@gmail.com	$2a$10$M2icFCVmvxuhjAHjAbfEUuDkq6s0tQNlbIqXeSGsLxRaARPIR0yj2	\N	1	5	t	\N	2025-09-20 03:50:32.151776	2025-11-05 08:00:48.659397	f	874908	+6282226197047
13	test3	test3@gmail.com	$2a$10$52SnEzsIdX3ZFbHVsGMniuj7Dnx4ftiznM0FFDM3NeDLtmvs.XgHK	\N	2	1	f	\N	2025-09-14 08:37:50.784887	2025-09-26 12:53:17.249902	f	5757	+6282226197047
30	wafiuddinB8A8	wafiuddinB8A8@gmail.com	$2a$04$PDy9gC94FHdP7HtxAKb57.dphRC7Qp48tM/YScLKcmVJHtcwBY6Ma	\N	3	1	t	\N	2025-11-05 13:22:37.607786	2025-11-05 13:22:37.607786	f	1144	082226197047
31	admin100aB9E7	admin100aB9E7@gmail.com	$2a$04$UyLf3MG2.pk6day3Bl4lHuc26iB29v5dq.OOyQJtIKg43h/caRA2y	\N	3	1	t	\N	2025-11-05 13:27:56.710699	2025-11-05 13:27:56.710699	f	1144	082226197047
32	adminBA2C	adminBA2C@gmail.com	$2a$04$RjAMSh.seY.qX8MIkjv.t.TzexJumyedxTqJQaBGKjvuOAVwRsWwG	\N	3	1	t	\N	2025-11-05 13:29:05.817278	2025-11-05 13:29:05.817278	f	1144	082226197047
33	nadaBA3E	nadaBA3E@gmail.com	$2a$04$U1Hs1JwXKlLp1thbrTlPweuMVQMSWJb7bzTTCQXq0JpyLei7nWOAi	\N	3	1	t	\N	2025-11-05 13:29:23.229821	2025-11-05 13:29:23.229821	f	1144	082226197047
34	adminBA2CBC48	adminBA2CBC48@gmail.com	$2a$04$zqtDz3rErsdgZzKuS.crTuk7z/36dBy.sRQ2ctgTAF3vIvesz0K6W	\N	3	1	t	\N	2025-11-05 13:38:05.381616	2025-11-05 13:38:05.381616	f	1144	082226197047
35	wafiuddinB8A8BDBA	wafiuddinB8A8BDBA@gmail.com	$2a$04$nX1slvm0F/R3WkuD5s8n.eW8eu7/qAre2IZ1YHS1l5tNupVSlPpE2	\N	3	1	t	\N	2025-11-05 13:44:15.600194	2025-11-05 13:44:15.600194	f	1144	082226197047
36	adminBE1F	adminBE1F@gmail.com	$2a$04$TCKZ6CXV5VSdxAydb8r/9.bwwgDv8bDASQX9eTDAs8ayLzWGwvouy	\N	3	1	t	\N	2025-11-05 13:45:55.863861	2025-11-05 13:45:55.863861	f	1144	082226197047
37	test24BEC7	test24BEC7@gmail.com	$2a$04$D9eB1OcoZdBDduXQxnnw2OyHZFAfZtRD/7GCcqNDV4WtuW.YJLfCO	\N	3	1	t	\N	2025-11-05 13:48:44.505416	2025-11-05 13:48:44.505416	f	1144	082226197047
38	adminajatestBF5F	adminajatestBF5F@gmail.com	$2a$04$o9nikOFyvkXQHNgG45v.F.7ejaSXTYboGQT.qDKeluyoak6dIn9jS	\N	3	1	t	\N	2025-11-05 13:51:16.821556	2025-11-05 13:51:16.821556	f	1144	082226197047
44	Dea	deamasrizal@gmail.com	$2a$10$gjcdsZcMoHrJNeN8EPJmte7.xh6kKLPm64Z3AZMwvNGtFGY.eWzf2	\N	3	1	t	\N	2025-11-06 09:19:56.461515	2025-11-06 09:19:56.461515	f	0	082383790600
1	admin	admin@gmail.com	password	wafiuddin	1	2	t	\N	2025-09-14 01:35:55.95613	2025-09-14 01:35:55.95613	f	0	+6282226197047
42	Ragilr7x3C31	Ragilr7x3C31@gmail.com	$2a$04$2yD9baZ7vsPZA/.48Zp/CeSDrb6eRkccJsV2eHDp8XckIfkPti.GK	\N	3	1	t	\N	2025-11-05 22:43:49.245305	2025-11-09 18:44:38.811027	f	10400	81535485848
22	testingotp	testingotp@stayhome.li	$2a$10$8xRWwxruTHBvjW/6bh9xk.T/SD8SuaGiMYPNVedjJXkiUV1P0COiG	\N	1	1	t	\N	2025-10-04 23:55:36.138712	2025-10-04 23:55:36.138712	f	0	+6282226197047
45	reseller202222	reseller202222@gmail.com	$2a$10$L0YlHAmV/xANVCbJYQScE.tnIrS9XaXuNTQZs9U40sgyNbzMUS1qO	\N	3	2	f	\N	2025-11-14 07:42:53.524009	2025-11-14 07:42:53.524009	f	0	+6282226197047
\.


--
-- Data for Name: vouchers; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.vouchers (id, code, type, title, description, amount, percentage, max_discount, min_cart_value, status, issued_qty, used_count, usage_limit, usage_per_user, valid_from, valid_until, is_active, created_at, updated_at) FROM stdin;
4	VOUCHERTESTING	hybrid	VOUCHERTESTING	VOUCHER DENGAN DISCOUNT 15 % + Rp. 30.000 Min Rp 40.000 Max DIscount Rp 2.000	30000.00	15.00	2000.00	40000.00		10	0	7	1	2025-10-02 09:08:00+00	2025-10-03 09:08:00+00	f	2025-10-02 06:38:37.622218+00	2025-10-02 09:09:49.73051+00
3	VOUCHERSAJA	hybrid	Promoinya	DISKON 50% + 1.0000 maks 15.000 Minimal Pembelian Rp 40.000	15000.00	50.00	15000.00	40000.00		10	0	7	5	2025-10-02 05:34:00+00	2025-10-10 05:35:00+00	f	2025-10-02 05:35:49.38964+00	2025-10-02 09:09:55.242749+00
1	222222	hybrid	oke	oke	10000.00	10.00	2000.00	20000.00		1	0	1	1	2025-09-14 13:47:00+00	2025-09-19 13:47:00+00	f	2025-09-14 13:48:00.053073+00	2025-11-09 01:54:04.171175+00
5	VOUCHERKUYY	hybrid	PROMOSINYA	VOUCHER DISKON 15 % + Rp 3000 Maksimal Rp 2000 Minimal Belanja Rp. 40.000	3000.00	15.00	2000.00	39974.00		48	0	6	1	2025-10-24 18:41:00+00	2025-10-30 18:41:00+00	f	2025-10-02 09:12:18.812439+00	2025-11-09 01:54:16.178379+00
6	NOVEMBERCERIA	percentage	NOVEMBER CERIA	NOVEMBER CERIA, Dapatkan disc 2% maks Rp. 5000 setiap melakukan transaksi sebesar minimal 10.000	0.00	2.00	5000.00	10000.00		5	0	1	1	2025-11-15 17:00:00+00	2025-11-16 17:00:00+00	t	2025-11-16 08:28:56.365248+00	2025-11-16 08:28:56.365248+00
\.


--
-- Data for Name: web_settings; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.web_settings (id, website_name, website_tagline, website_description, website_keywords, logo_url, logo_dark_url, favicon_url, business_name, business_address, business_phone, business_email, business_hours, url_facebook, url_instagram, url_twitter, url_youtube, url_tiktok, url_whatsapp, whatsapp_number, whatsapp_message, url_saluran_whatsapp, footer_text, copyright_text, show_social_links, show_contact_info, created_at, updated_at, branch_id) FROM stdin;
1	UDATOUPUP	UDATOUPUP	UDATOUPUP    adalah Platform Resmi Untuk Semua Kebutuhan TopUp & Voucher Game.               Menyediakan Harga Termurah, Proses Cepat, dan Kebutuhan Lainnya               dengan harga Kompetitif.	AAJAJAJA,AKAKAKA,AKAKAKA	https://res.cloudinary.com/dikf91ikq/image/upload/v1759818206/mkstore/other/8d76e387-bcb3-4d24-be53-a82aa03e3cac_s0xnq6.png	https://res.cloudinary.com/dikf91ikq/image/upload/v1758165242/logo_ji9nzn.png	https://res.cloudinary.com/dikf91ikq/image/upload/v1759818206/mkstore/other/8d76e387-bcb3-4d24-be53-a82aa03e3cac_s0xnq6.png	UDATOUPUP	PT. Sahabat Digital Nusantara 18 Office Park Building, 21th Floor Unit C Jl TB Simatupang no. 18 Kebagusan, Kec Pasar Minggu,  Jakarta Selatan, DKI Jakarta Kode Pos 12520	+6281535485848	sahabatdigitalnusantara@gmail.com	OPEN EVERYDAY	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	+62654165465465	Halo! Saya tertarik dengan produk Anda.	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	\N	© 2025 UDATOPUP All rights reserved.	t	t	2025-09-20 01:42:01.904724	2025-10-03 03:47:10.992973	1
2	UDATOUPUP	UDATOUPUP	UDATOUPUP	TOPUPKUY	https://res.cloudinary.com/dikf91ikq/image/upload/v1759818206/mkstore/other/8d76e387-bcb3-4d24-be53-a82aa03e3cac_s0xnq6.png	https://res.cloudinary.com/dikf91ikq/image/upload/v1758165242/logo_ji9nzn.png	https://res.cloudinary.com/dikf91ikq/image/upload/v1759818206/mkstore/other/8d76e387-bcb3-4d24-be53-a82aa03e3cac_s0xnq6.png	UDATOUPUP	PT. Sahabat Digital Nusantara\n18 Office Park Building, 21th Floor Unit C\nJl TB Simatupang no. 18\nKebagusan, Kec Pasar Minggu, \nJakarta Selatan, DKI Jakarta\nKode Pos 12520	+6282226197047	wafiq610@gmail.com	ANANANANAN	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	https://example.com/logo.png	https://www.duitku.com/	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	+62654165465465	Halo! Saya tertarik dengan produk Anda.	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1		© 2025 UDATOPUP All rights reserved.	t	t	2025-09-17 20:55:11.172511	2025-09-23 09:50:16.995115	2
22	UDATOUPUPAJA	UDATOUPUP	UDATOUPUP    adalah Platform Resmi Untuk Semua Kebutuhan TopUp & Voucher Game.               Menyediakan Harga Termurah, Proses Cepat, dan Kebutuhan Lainnya               dengan harga Kompetitif.	UDATOPUP    adalah Platform Resmi Untuk Semua Kebutuhan TopUp & Voucher Game.               Menyediakan Harga Termurah, Proses Cepat, dan Kebutuhan Lainnya               dengan harga Kompetitif.	https://res.cloudinary.com/dikf91ikq/image/upload/v1759818206/mkstore/other/8d76e387-bcb3-4d24-be53-a82aa03e3cac_s0xnq6.png	https://res.cloudinary.com/dikf91ikq/image/upload/v1758165242/logo_ji9nzn.png	https://res.cloudinary.com/dikf91ikq/image/upload/v1759818206/mkstore/other/8d76e387-bcb3-4d24-be53-a82aa03e3cac_s0xnq6.png	UDATOUPUP	PT. Sahabat Digital Nusantara 18 Office Park Building, 21th Floor Unit C Jl TB Simatupang no. 18 Kebagusan, Kec Pasar Minggu,  Jakarta Selatan, DKI Jakarta Kode Pos 12520	+6282226197047	sahabatdigitalnusantara@gmail.com	OPEN EVERYDAY	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	+6282226197047	Halo! Saya tertarik dengan produk Anda.	https://www.youtube.com/watch?v=nwbxIkWGcCs&list=RDnwbxIkWGcCs&start_radio=1	TOP UP GAME TERBAIK DI DUNIA SE INDONESIA	© 2025 UDATOPUP All rights reserved.	t	t	2025-09-30 07:18:12.542653	2025-10-13 13:05:17.187651	5
24	TOPUPKUY	TOPUPKUY	TEST	TOPUPKUY adalah Platform Resmi Untuk Semua Kebutuhan TopUp & Voucher Game. Menyediakan Harga Termurah, Proses Cepat, dan Kebutuhan Lainnya dengan harga Kompetitif.	https://res.cloudinary.com/dikf91ikq/image/upload/v1759818206/mkstore/other/8d76e387-bcb3-4d24-be53-a82aa03e3cac_s0xnq6.png	https://res.cloudinary.com/dikf91ikq/image/upload/v1759818206/mkstore/other/8d76e387-bcb3-4d24-be53-a82aa03e3cac_s0xnq6.png	https://res.cloudinary.com/dikf91ikq/image/upload/v1759818206/mkstore/other/8d76e387-bcb3-4d24-be53-a82aa03e3cac_s0xnq6.png	TOPUPKUY	Jl. Lembah Nyiur 3 No.9 Blok L7, RT.4/RW.9, Pd. Klp., Kec. Duren Sawit, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13450	+6285695721685	storevazz09@gmail.com								+62822261970479				 © 2025 WFDNSTORE All rights reserved. 	t	t	2025-10-27 12:59:30.307732	2025-10-30 10:43:32.058124	6
\.


--
-- Name: banner_web_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.banner_web_id_seq', 18, true);


--
-- Name: branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.branches_id_seq', 11, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.categories_id_seq', 160, true);


--
-- Name: fees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.fees_id_seq', 538, true);


--
-- Name: flash_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.flash_sale_id_seq', 17, true);


--
-- Name: flash_sale_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.flash_sale_products_id_seq', 20, true);


--
-- Name: form_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.form_fields_id_seq', 167, true);


--
-- Name: gallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.gallery_id_seq', 6, true);


--
-- Name: list_domain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.list_domain_id_seq', 172, true);


--
-- Name: list_web_cabang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.list_web_cabang_id_seq', 3, true);


--
-- Name: memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.memberships_id_seq', 1, false);


--
-- Name: notification_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.notification_templates_id_seq', 11, true);


--
-- Name: packet_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.packet_features_id_seq', 5, true);


--
-- Name: password_resets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.password_resets_id_seq', 12, true);


--
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.payment_methods_id_seq', 1, false);


--
-- Name: popup_desc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.popup_desc_id_seq', 8, true);


--
-- Name: product_providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.product_providers_id_seq', 16918, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.products_id_seq', 2770, true);


--
-- Name: providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.providers_id_seq', 11, true);


--
-- Name: register_reseller_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.register_reseller_transaction_id_seq', 32, true);


--
-- Name: reseller_packet_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.reseller_packet_features_id_seq', 5, true);


--
-- Name: reseller_packet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.reseller_packet_id_seq', 30, true);


--
-- Name: reseller_pricing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.reseller_pricing_id_seq', 12115, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.reviews_id_seq', 5, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: transaction_check_nickname_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.transaction_check_nickname_id_seq', 221, true);


--
-- Name: transaction_reseller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.transaction_reseller_id_seq', 68, true);


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.transactions_id_seq', 367, true);


--
-- Name: user_balance_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.user_balance_logs_id_seq', 74, true);


--
-- Name: user_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.user_sessions_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.users_id_seq', 50, true);


--
-- Name: vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.vouchers_id_seq', 6, true);


--
-- Name: web_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.web_settings_id_seq', 24, true);


--
-- Name: admin_numbers admin_number_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.admin_numbers
    ADD CONSTRAINT admin_number_pkey PRIMARY KEY (phone_number);


--
-- Name: banner_web banner_web_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.banner_web
    ADD CONSTRAINT banner_web_pkey PRIMARY KEY (id);


--
-- Name: branches branches_code_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_code_key UNIQUE (code);


--
-- Name: branches branches_domain_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_domain_key UNIQUE (domain);


--
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: environment_variables environtment_variables_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.environment_variables
    ADD CONSTRAINT environtment_variables_pkey PRIMARY KEY (code);


--
-- Name: fees fees_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.fees
    ADD CONSTRAINT fees_pkey PRIMARY KEY (id);


--
-- Name: flash_sale flash_sale_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.flash_sale
    ADD CONSTRAINT flash_sale_pkey PRIMARY KEY (id);


--
-- Name: flash_sale_products flash_sale_products_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.flash_sale_products
    ADD CONSTRAINT flash_sale_products_pkey PRIMARY KEY (id);


--
-- Name: form_fields form_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.form_fields
    ADD CONSTRAINT form_fields_pkey PRIMARY KEY (id);


--
-- Name: gallery gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.gallery
    ADD CONSTRAINT gallery_pkey PRIMARY KEY (id);


--
-- Name: list_domain list_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.list_domain
    ADD CONSTRAINT list_domain_pkey PRIMARY KEY (id);


--
-- Name: list_web_cabang list_web_cabang_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.list_web_cabang
    ADD CONSTRAINT list_web_cabang_pkey PRIMARY KEY (id);


--
-- Name: memberships memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id);


--
-- Name: notification_templates notification_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.notification_templates
    ADD CONSTRAINT notification_templates_pkey PRIMARY KEY (id);


--
-- Name: packet_features packet_features_code_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.packet_features
    ADD CONSTRAINT packet_features_code_key UNIQUE (code);


--
-- Name: packet_features packet_features_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.packet_features
    ADD CONSTRAINT packet_features_pkey PRIMARY KEY (id);


--
-- Name: password_resets password_resets_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_pkey PRIMARY KEY (id);


--
-- Name: password_resets password_resets_token_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_token_key UNIQUE (token);


--
-- Name: payment_methods payment_methods_code_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_code_key UNIQUE (code);


--
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: popup_desc popup_desc_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.popup_desc
    ADD CONSTRAINT popup_desc_pkey PRIMARY KEY (id);


--
-- Name: product_providers product_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.product_providers
    ADD CONSTRAINT product_providers_pkey PRIMARY KEY (id);


--
-- Name: product_providers product_providers_provider_id_product_code_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.product_providers
    ADD CONSTRAINT product_providers_provider_id_product_code_key UNIQUE (provider_id, product_code);


--
-- Name: product_providers product_providers_unique; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.product_providers
    ADD CONSTRAINT product_providers_unique UNIQUE (provider_id, product_code);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: providers providers_code_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_code_key UNIQUE (code);


--
-- Name: providers providers_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- Name: register_reseller_transaction register_reseller_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.register_reseller_transaction
    ADD CONSTRAINT register_reseller_transaction_pkey PRIMARY KEY (id);


--
-- Name: reseller_packet_features reseller_packet_features_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.reseller_packet_features
    ADD CONSTRAINT reseller_packet_features_pkey PRIMARY KEY (id);


--
-- Name: reseller_packet reseller_packet_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.reseller_packet
    ADD CONSTRAINT reseller_packet_pkey PRIMARY KEY (id);


--
-- Name: reseller_pricing reseller_pricing_branch_product_unique; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.reseller_pricing
    ADD CONSTRAINT reseller_pricing_branch_product_unique UNIQUE (branch_id, product_code);


--
-- Name: reseller_pricing reseller_pricing_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.reseller_pricing
    ADD CONSTRAINT reseller_pricing_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: transaction_check_nickname transaction_check_nickname_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.transaction_check_nickname
    ADD CONSTRAINT transaction_check_nickname_pkey PRIMARY KEY (id);


--
-- Name: transaction_check_nickname transaction_check_nickname_tujuan_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.transaction_check_nickname
    ADD CONSTRAINT transaction_check_nickname_tujuan_key UNIQUE (tujuan);


--
-- Name: transaction_reseller transaction_reseller_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.transaction_reseller
    ADD CONSTRAINT transaction_reseller_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: reseller_packet unique_kode_payment; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.reseller_packet
    ADD CONSTRAINT unique_kode_payment UNIQUE (kode_payment);


--
-- Name: notification_templates unique_template; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.notification_templates
    ADD CONSTRAINT unique_template UNIQUE (branch_id, notification_type, via);


--
-- Name: user_balance_logs user_balance_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.user_balance_logs
    ADD CONSTRAINT user_balance_logs_pkey PRIMARY KEY (id);


--
-- Name: user_sessions user_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_sessions_pkey PRIMARY KEY (id);


--
-- Name: user_sessions user_sessions_user_id_domain_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_sessions_user_id_domain_key UNIQUE (user_id, domain);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: vouchers vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_pkey PRIMARY KEY (id);


--
-- Name: brand_1761226821124_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE UNIQUE INDEX brand_1761226821124_index ON public.categories USING btree (brand);


--
-- Name: code_1760155018841_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX code_1760155018841_index ON public.sub_categories USING btree (code);


--
-- Name: flash_sale_products_flash_sale_id_product_id_key; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE UNIQUE INDEX flash_sale_products_flash_sale_id_product_id_key ON public.flash_sale_products USING btree (flash_sale_id, product_id);


--
-- Name: idx_branch_active; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_branch_active ON public.gallery USING btree (branch_id) WHERE (is_active = true);


--
-- Name: idx_branch_id; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_branch_id ON public.gallery USING btree (branch_id);


--
-- Name: idx_branch_types; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_branch_types ON public.gallery USING btree (branch_id, types);


--
-- Name: idx_created_at; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_created_at ON public.reseller_packet USING btree (created_at);


--
-- Name: idx_email; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_email ON public.register_reseller_transaction USING btree (email);


--
-- Name: idx_email_status; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_email_status ON public.register_reseller_transaction USING btree (email, status);


--
-- Name: idx_feature_code; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_feature_code ON public.packet_features USING btree (code);


--
-- Name: idx_fees_reference_active; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_fees_reference_active ON public.fees USING btree (reference_name, is_active) WHERE (is_active = true);


--
-- Name: idx_flash_sale_active_time; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_flash_sale_active_time ON public.flash_sale USING btree (is_active, start_at, end_at);


--
-- Name: idx_flash_sale_products_product; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_flash_sale_products_product ON public.flash_sale_products USING btree (product_id);


--
-- Name: idx_flash_sale_products_sale; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_flash_sale_products_sale ON public.flash_sale_products USING btree (flash_sale_id);


--
-- Name: idx_flash_sale_time_range; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_flash_sale_time_range ON public.flash_sale USING btree (start_at, end_at);


--
-- Name: idx_method_code; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_method_code ON public.register_reseller_transaction USING btree (method_code);


--
-- Name: idx_notification_templates_active; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_notification_templates_active ON public.notification_templates USING btree (is_active);


--
-- Name: idx_notification_templates_branch; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_notification_templates_branch ON public.notification_templates USING btree (branch_id);


--
-- Name: idx_notification_templates_type; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_notification_templates_type ON public.notification_templates USING btree (notification_type);


--
-- Name: idx_packet_code; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_packet_code ON public.reseller_packet_features USING btree (packet_code);


--
-- Name: idx_phone_number; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_phone_number ON public.register_reseller_transaction USING btree (phone_number);


--
-- Name: idx_product_providers_product_id; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_product_providers_product_id ON public.product_providers USING btree (product_id) WHERE (provider_id IS NOT NULL);


--
-- Name: idx_products_category; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_products_category ON public.products USING btree (category_brand) WHERE (is_active = true);


--
-- Name: idx_products_search; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_products_search ON public.products USING btree (name, code, category_brand) WHERE (is_deleted = false);


--
-- Name: idx_products_updated_id; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_products_updated_id ON public.products USING btree (updated_at DESC, id) WHERE (is_deleted = false);


--
-- Name: idx_providers_id_name; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_providers_id_name ON public.providers USING btree (id, name);


--
-- Name: idx_reference_id; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_reference_id ON public.register_reseller_transaction USING btree (reference_id);


--
-- Name: idx_reseller_packet_id; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_reseller_packet_id ON public.register_reseller_transaction USING btree (reseller_packet_id);


--
-- Name: idx_reseller_pricing_active_flags; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_reseller_pricing_active_flags ON public.reseller_pricing USING btree (is_active, is_main_active) WHERE ((is_active = true) AND (is_main_active = true));


--
-- Name: idx_reseller_pricing_branch_active; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_reseller_pricing_branch_active ON public.reseller_pricing USING btree (branch_id, is_active) INCLUDE (product_code, margin_default_amount, margin_default_percentage);


--
-- Name: idx_status; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_status ON public.register_reseller_transaction USING btree (status);


--
-- Name: idx_status_created; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_status_created ON public.register_reseller_transaction USING btree (status, created_at DESC);


--
-- Name: idx_transaction_check_nickname_created_at; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_check_nickname_created_at ON public.transaction_check_nickname USING btree (created_at);


--
-- Name: idx_transaction_check_nickname_ref_id; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_check_nickname_ref_id ON public.transaction_check_nickname USING btree (ref_id);


--
-- Name: idx_transaction_reseller_branch_created; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_reseller_branch_created ON public.transaction_reseller USING btree (branch_id, created_at DESC);


--
-- Name: idx_transaction_reseller_branch_id; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_reseller_branch_id ON public.transaction_reseller USING btree (branch_id);


--
-- Name: idx_transaction_reseller_branch_status; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_reseller_branch_status ON public.transaction_reseller USING btree (branch_id, status);


--
-- Name: idx_transaction_reseller_created_at; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_reseller_created_at ON public.transaction_reseller USING btree (created_at DESC);


--
-- Name: idx_transaction_reseller_email; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_reseller_email ON public.transaction_reseller USING btree (email);


--
-- Name: idx_transaction_reseller_payment_code; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_reseller_payment_code ON public.transaction_reseller USING btree (payment_code);


--
-- Name: idx_transaction_reseller_phone_number; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_reseller_phone_number ON public.transaction_reseller USING btree (phone_number);


--
-- Name: idx_transaction_reseller_product_code; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_reseller_product_code ON public.transaction_reseller USING btree (product_code);


--
-- Name: idx_transaction_reseller_reference_id; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_reseller_reference_id ON public.transaction_reseller USING btree (reference_id);


--
-- Name: idx_transaction_reseller_status; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_reseller_status ON public.transaction_reseller USING btree (status);


--
-- Name: idx_transaction_reseller_status_created; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_reseller_status_created ON public.transaction_reseller USING btree (status, created_at DESC);


--
-- Name: idx_transaction_reseller_trx_id; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_reseller_trx_id ON public.transaction_reseller USING btree (trx_id);


--
-- Name: idx_transaction_reseller_updated_at; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_reseller_updated_at ON public.transaction_reseller USING btree (updated_at DESC);


--
-- Name: idx_transaction_reseller_user_created; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_reseller_user_created ON public.transaction_reseller USING btree (user_id, created_at DESC);


--
-- Name: idx_transaction_reseller_user_id; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transaction_reseller_user_id ON public.transaction_reseller USING btree (user_id);


--
-- Name: idx_transactions_completed_at; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transactions_completed_at ON public.transactions USING btree (completed_at DESC) WHERE (completed_at IS NOT NULL);


--
-- Name: idx_transactions_created_at; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transactions_created_at ON public.transactions USING btree (created_at DESC);


--
-- Name: idx_transactions_status; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transactions_status ON public.transactions USING btree (status);


--
-- Name: idx_transactions_status_created_at; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transactions_status_created_at ON public.transactions USING btree (status, created_at DESC);


--
-- Name: idx_transactions_user_created_at; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transactions_user_created_at ON public.transactions USING btree (user_id, created_at DESC);


--
-- Name: idx_transactions_user_status; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_transactions_user_status ON public.transactions USING btree (user_id, status);


--
-- Name: idx_type_package; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_type_package ON public.reseller_packet USING btree (type_package);


--
-- Name: idx_types; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_types ON public.gallery USING btree (types);


--
-- Name: idx_types_active; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_types_active ON public.gallery USING btree (types) WHERE (is_active = true);


--
-- Name: idx_user_balance_logs_created_at; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_user_balance_logs_created_at ON public.user_balance_logs USING btree (created_at);


--
-- Name: idx_user_balance_logs_user_id; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_user_balance_logs_user_id ON public.user_balance_logs USING btree (user_id);


--
-- Name: idx_user_sessions_active; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_user_sessions_active ON public.user_sessions USING btree (user_id, is_active, expires_at);


--
-- Name: idx_users_branch_role; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_users_branch_role ON public.users USING btree (branch_id, role_id) WHERE (is_active = true);


--
-- Name: idx_vouchers_active_time; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_vouchers_active_time ON public.vouchers USING btree (is_active, valid_from, valid_until);


--
-- Name: idx_vouchers_code; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_vouchers_code ON public.vouchers USING btree (code);


--
-- Name: idx_vouchers_status; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX idx_vouchers_status ON public.vouchers USING btree (status);


--
-- Name: products_code_key; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE UNIQUE INDEX products_code_key ON public.products USING btree (code);


--
-- Name: reference_name_1761142749213_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE UNIQUE INDEX reference_name_1761142749213_index ON public.fees USING btree (reference_name);


--
-- Name: region_1760501075614_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX region_1760501075614_index ON public.sub_categories USING btree (region);


--
-- Name: transactions_reference_id_key; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE UNIQUE INDEX transactions_reference_id_key ON public.transactions USING btree (reference_id);


--
-- Name: trx_id_1760430553193_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX trx_id_1760430553193_index ON public.transactions USING btree (trx_id);


--
-- Name: uk_products_code_main_provider; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE UNIQUE INDEX uk_products_code_main_provider ON public.products USING btree (code, main_provider_id);


--
-- Name: user_id_1756729958090_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX user_id_1756729958090_index ON public.transactions USING btree (user_id);


--
-- Name: vouchers_code_key; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE UNIQUE INDEX vouchers_code_key ON public.vouchers USING btree (code);


--
-- Name: web_settings branch_id; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.web_settings
    ADD CONSTRAINT branch_id FOREIGN KEY (branch_id) REFERENCES public.branches(id) ON DELETE CASCADE;


--
-- Name: flash_sale_products flash_sale_products_flash_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.flash_sale_products
    ADD CONSTRAINT flash_sale_products_flash_sale_id_fkey FOREIGN KEY (flash_sale_id) REFERENCES public.flash_sale(id);


--
-- Name: reseller_packet_features reseller_packet_features_packet_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.reseller_packet_features
    ADD CONSTRAINT reseller_packet_features_packet_code_fkey FOREIGN KEY (packet_code) REFERENCES public.reseller_packet(kode_payment) ON DELETE CASCADE;


--
-- Name: user_balance_logs user_balance_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.user_balance_logs
    ADD CONSTRAINT user_balance_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_sessions user_sessions_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_sessions_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branches(id);


--
-- Name: user_sessions user_sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users users_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branches(id);


--
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

\unrestrict Y42PHFzyycqfFMVhNnB0T9MfrOMRdBxssUReZgLe7fiFGv6tcmsq1Z4cL2JJaMf

